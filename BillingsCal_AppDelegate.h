#import <Cocoa/Cocoa.h>
#import "FMDatabase.h"


@interface BillingsCal_AppDelegate : NSObject {
#ifndef NOIVARS
  @protected
    NSWindow                     *window;
    NSDatePicker                 *datePicker;
    NSTextView                   *outputView;
    NSManagedObjectContext       *moc;
    FMDatabase                   *db;
#endif
}

@property(assign) IBOutlet NSWindow                     *window;
@property(assign) IBOutlet NSDatePicker                 *datePicker;
@property(assign) IBOutlet NSTextView                   *outputView;
@property(retain)          NSManagedObjectContext       *moc;
@property(retain)          FMDatabase                   *db;

- (IBAction)updateDate:(NSDatePicker*)sender_;

@end