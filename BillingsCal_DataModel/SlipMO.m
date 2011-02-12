#import "SlipMO.h"

@implementation SlipMO

- (double)duration {
    return [[self.entries valueForKeyPath:@"@sum.duration"] doubleValue];
}

@end
