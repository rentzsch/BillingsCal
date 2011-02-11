#import "BillingsCal_AppDelegate.h"

@interface NSDate (jr_midnight)
- (NSDate*)jr_midnight;
@end

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
    
/*
    client.name (00h 01m 59s total)
      project.name (00h 01m 59s total)
        slip.name (00h 01m 59s total)
          00h 01m 59s  12:24:24 PM => 12:26:23
*/
    
    FMResultSet *rs = [db executeQuery:@"select rowid,* from TimeEntry where startDateTime >= ? and startDateTime <= ?",
                       [NSNumber numberWithDouble:[beginRange timeIntervalSince1970]],
                       [NSNumber numberWithDouble:[endRange timeIntervalSince1970]]
                       ];
    
    if ([db hadError]) {
        NSLog(@"db err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
        return;
    }
    
    double totalDuration = 0;
    while ([rs next]) {
        int32_t slipPK = [rs intForColumn:@"timeSlipID"];
        
        
        
        
        double startDateTime = [rs doubleForColumn:@"startDateTime"];
        double endDateTime = [rs doubleForColumn:@"endDateTime"];
        double duration = endDateTime - startDateTime;
        totalDuration += duration;
        [output appendFormat:@"%@  %@ => %@\n",
         secondsToTimeAmount(duration),
         formatTimeInterval(startDateTime),
         formatTimeInterval(endDateTime)
         ];
    }
    [output appendFormat:@"\n---\n%@", secondsToTimeAmount(totalDuration)];
    [outputView setString:output];
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