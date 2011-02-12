#import "ProjectMO.h"

@implementation ProjectMO

- (double)duration {
    return [[self.slips valueForKeyPath:@"@sum.duration"] doubleValue];
}

@end
