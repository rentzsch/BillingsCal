#import "ClientMO.h"

@implementation ClientMO

- (double)duration {
    return [[self.projects valueForKeyPath:@"@sum.duration"] doubleValue];
}

@end
