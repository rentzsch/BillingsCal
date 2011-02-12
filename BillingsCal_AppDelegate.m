#import "BillingsCal_AppDelegate.h"
#import "FMDatabaseAdditions.h"
#import "CoreData+JRExtensions.h"
#import "ClientMO.h"
#import "ProjectMO.h"
#import "SlipMO.h"
#import "EntryMO.h"

@interface NSDate (jr_midnight)
- (NSDate*)jr_midnight;
@end
@interface NSManagedObjectContext (jr_save)
- (void)jr_save;
@end
@interface NSSet (jr_sortWithKey)
- (NSArray*)jr_sortWithKey:(NSString*)key_;
@end

//-----------------------------------------------------------------------------------------

@implementation BillingsCal_AppDelegate
@synthesize window;
@synthesize datePicker;
@synthesize outputView;
@synthesize moc;
@synthesize db;

- (void)applicationDidFinishLaunching:(NSNotification*)notification_ {
    NSError *error = nil;
    
    // Core Data
    NSPersistentStoreCoordinator *psc = nil;
    if (!error) {
        NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:nil];
        psc = [[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom] autorelease];
        [psc addPersistentStoreWithType:NSInMemoryStoreType 
                          configuration:nil 
                                    URL:nil 
                                options:nil 
                                  error:&error];
    }
    if (!error) {
        moc = [[NSManagedObjectContext alloc] init];
        [moc setPersistentStoreCoordinator:psc];
    }
    
    // SQLite
    if (!error) {
        NSString *appSupPath = [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *dbPath = [appSupPath stringByAppendingPathComponent:@"Billings/Database/billings.bid"];
        
        self.db = [FMDatabase databaseWithPath:dbPath];
        BOOL opened = [db open];
        assert(opened);
        //[db setTraceExecution:YES];
    }
    
    // UI
    if (!error) {
        [outputView setFont:[NSFont fontWithName:@"Menlo" size:11]];
        [datePicker setDateValue:[NSDate date]];
        [self updateDate:datePicker];   
    }
    
    if (error) {
        [NSApp presentError:error];
        [NSApp terminate:nil];
    }
}

- (void)dealloc {
    [moc release];
    [db release];
	
    [super dealloc];
}

static NSString* formatTimeInterval(double timeIntervalSince1970) {
    static NSDateFormatter *df = nil;
    if (!df) {
        df = [[NSDateFormatter alloc] initWithDateFormat:@"%a %b %e %Y %I:%M:%S %p" allowNaturalLanguage:NO];
    }
    return [df stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeIntervalSince1970]];
}

static NSString* secondsToTimeAmount(unsigned interval) {
    #define kSecondsInOneMinute 60
    #define kSecondsInOneHour   3600
	
	unsigned hours = 0, minutes = 0, seconds = 0;
	if( interval >= kSecondsInOneHour ) {
		hours = interval / kSecondsInOneHour;
		interval -= hours * kSecondsInOneHour;
	}
	if( interval >= kSecondsInOneMinute ) {
		minutes = interval / kSecondsInOneMinute;
		interval -= minutes * kSecondsInOneMinute;
	}
	seconds = interval;
	
	return [NSString stringWithFormat:@"%.2ih %.2im %.2is", hours, minutes, seconds];	
}

- (IBAction)updateDate:(NSDatePicker*)sender_ {
    NSMutableString *output = [NSMutableString string];
    
    NSDate *beginRange = [[datePicker dateValue] jr_midnight];
    NSDate *endRange = [beginRange dateByAddingTimeInterval:[datePicker timeInterval] + 86399];
    [output appendFormat:@"%@ => %@\n\n", beginRange, endRange];
        
    FMResultSet *rs = nil;
    
    //
    // Gather entries.
    //
    
    rs = [db executeQuery:@"select rowid,* from TimeEntry where startDateTime >= ? and startDateTime <= ?",
          [NSNumber numberWithDouble:[beginRange timeIntervalSince1970]],
          [NSNumber numberWithDouble:[endRange timeIntervalSince1970]]
          ];
    
    if ([db hadError]) {
        NSLog(@"db err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return;
    }
    
    while ([rs next]) {
        int32_t slipID = [rs intForColumn:@"timeSlipID"];
        
        SlipMO *slip = [SlipMO fetchOneWithSlipID:moc slipID:[NSNumber numberWithInt:slipID]];
        if (!slip) {
            slip = [SlipMO insertInManagedObjectContext:moc];
            slip.slipIDValue = slipID;
            [moc jr_save];
        }
        
        EntryMO *entry = [EntryMO insertInManagedObjectContext:moc];
        entry.slip = slip;
        entry.startInSecondsSince1970Value = [rs doubleForColumn:@"startDateTime"];
        entry.endInSecondsSince1970Value = [rs doubleForColumn:@"endDateTime"];
        [moc jr_save];
    }
    
    //
    // Gather referenced Slips
    //
    
    for (SlipMO *slip in [SlipMO jr_fetchAll:moc]) {
        // select name, projectID from TimeSlip where _rowid = 6900
        slip.name = [db stringForQuery:@"select name from TimeSlip where _rowid = ?", slip.slipID];
        
        int32_t projectID = [db intForQuery:@"select projectID from TimeSlip where _rowid = ?", slip.slipID];
        ProjectMO *project = [ProjectMO fetchOneWithProjectID:moc projectID:[NSNumber numberWithInt:projectID]];
        if (!project) {
            project = [ProjectMO insertInManagedObjectContext:moc];
            project.projectIDValue = projectID;
        }
        slip.project = project;
        [moc jr_save];
    }
    
    //
    // Gather referenced Projects
    //
    
    for (ProjectMO *project in [ProjectMO jr_fetchAll:moc]) {
        // select name, clientID from Project where _rowid = 1000
        project.name = [db stringForQuery:@"select name from Project where _rowid = ?", project.projectID];
        
        int32_t clientID = [db intForQuery:@"select clientID from Project where _rowid = ?", project.projectID];
        ClientMO *client = [ClientMO fetchOneWithClientID:moc clientID:[NSNumber numberWithInt:clientID]];
        if (!client) {
            client = [ClientMO insertInManagedObjectContext:moc];
            client.clientIDValue = clientID;
        }
        project.client = client;
        [moc jr_save];
    }
    
    //
    // Gather referenced Clients
    //
    
    for (ClientMO *client in [ClientMO jr_fetchAll:moc]) {
        // select * from Client where _rowid = 1000
        client.name = [db stringForQuery:@"select company from Client where _rowid = ?", client.clientID];
        [moc jr_save];
    }
    
    //
    // Print Report
    //
    // client.name (00h 01m 59s total)
    //   project.name (00h 01m 59s total)
    //     slip.name (00h 01m 59s total)
    //       00h 01m 59s  12:24:24 PM => 12:26:23
    //
    
    for (ClientMO *client in [ClientMO jr_fetchAll:moc]) { // will be sorted by name automatically
        [output appendFormat:@"%@ (%@ total)\n", client.name, secondsToTimeAmount([client duration])];
        for (ProjectMO *project in [client.projects jr_sortWithKey:@"name"]) {
            [output appendFormat:@"  %@ (%@ total)\n", project.name, secondsToTimeAmount([project duration])];
            for (SlipMO *slip in [project.slips jr_sortWithKey:@"name"]) {
                [output appendFormat:@"    %@ (%@ total)\n", slip.name, secondsToTimeAmount([slip duration])];
                for (EntryMO *entry in [slip.entries jr_sortWithKey:@"startInSecondsSince1970"]) {
                    [output appendFormat:
                     @"      %@  %@ => %@\n",
                     secondsToTimeAmount([entry duration]),
                     formatTimeInterval(entry.startInSecondsSince1970Value),
                     formatTimeInterval(entry.endInSecondsSince1970Value)];
                }
            }
        }
    }
    [outputView setString:output];
    
    //
    // Delete all objects for a fresh report next time (yay cascade deleting).
    //    
    for (ClientMO *client in [ClientMO jr_fetchAll:moc]) {
        [moc deleteObject:client];
    }
    [moc jr_save];
}

@end

@implementation NSDate (jr_midnight)
- (NSDate*)jr_midnight {
    NSCalendarDate *calendarDate = [NSCalendarDate dateWithTimeIntervalSince1970:[self timeIntervalSince1970]];
    return [NSCalendarDate dateWithYear:[calendarDate yearOfCommonEra]
                                  month:[calendarDate monthOfYear]
                                    day:[calendarDate dayOfMonth]
                                   hour:0
                                 minute:0
                                 second:0
                               timeZone:[calendarDate timeZone]];
}
@end

@implementation NSManagedObjectContext (jr_save)
- (void)jr_save {
    NSError *error = nil;
    if (![self save:&error]) {
        NSLog(@"%@ %@", error, [error userInfo]);
        [NSApp presentError:error];
        [NSApp terminate:nil];
    }
}
@end

@implementation NSSet (jr_sortWithKey)
- (NSArray*)jr_sortWithKey:(NSString*)key_ {
    return [[self allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:key_ ascending:YES]]];
}
@end