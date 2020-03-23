#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSUInteger k = 0;
    a = [a uppercaseString];
    for (NSUInteger i = 0; i < [b length]; i++) {
        unichar c = [b characterAtIndex:i];
        
        BOOL f = false;
        for (NSUInteger j = k; j < [a length]; j++) {
            if ([a characterAtIndex:j] == c) {
                f = true;
                k = j + 1;
                break;
            }
        }
        
        if (f == false) {
            return @"NO";
        }
    }
    
    return @"YES";
}
@end
