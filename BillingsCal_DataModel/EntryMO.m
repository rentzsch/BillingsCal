#import "EntryMO.h"

@implementation EntryMO

- (double)duration {
    return self.endInSecondsSince1970Value - self.startInSecondsSince1970Value;
}

@end
