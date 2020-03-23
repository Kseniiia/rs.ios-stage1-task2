#import "FibonacciResolver.h"

@implementation FibonacciResolver

- (NSUInteger)fibonacci:(NSUInteger)n {
    if (n < 2) {
        return n;
    }
    return [self fibonacci:n - 1] + [self fibonacci:n - 2];
}

- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    for (int i = 0; ; i++) {
        NSUInteger fib1 = [self fibonacci:i];
        NSUInteger fib2 = [self fibonacci:i + 1];
        if (fib1 * fib2 == [number intValue]) {
            return @[[NSNumber numberWithInt:(int)fib1], [NSNumber numberWithInt:(int)fib2], @1];
        }
        
        if (fib1 * fib2 > [number intValue]) {
            return @[[NSNumber numberWithInt:(int)fib1], [NSNumber numberWithInt:(int)fib2], @0];
        }
    }
    return @[];
}
@end
