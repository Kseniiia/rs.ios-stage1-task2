#import "Blocks.h"

@implementation Blocks

NSArray *arr;

-(BlockA)blockA {
    if (!_blockA) {
        self.blockA = ^(NSArray *array) {
            arr = array;
        };
    }
    return _blockA;
}

-(BlockB)blockB {
    if (!_blockB) {
        __weak Blocks *weakSelf = self;
        
        self.blockB = ^(Class class) {
            Blocks *innerSelf = weakSelf;
            
            NSObject *result = nil;
            if (class == [NSNumber class]) {
                int sum = 0;
                for (int i = 0; i < [arr count]; i++) {
                    id c = [arr objectAtIndex:i];
                    if ([c isKindOfClass:[NSNumber class]]) {
                        sum = sum + [c intValue];
                    }
                }
                result = [NSNumber numberWithInt:sum];
            }
            
            if (class == [NSString class]) {
                NSString *sum = @"";
                for (int i = 0; i < [arr count]; i++) {
                    id c = [arr objectAtIndex:i];
                    if ([c isKindOfClass:[NSString class]]) {
                        sum = [sum stringByAppendingString:c];
                    }
                }
                result = sum;
            }
            
            if (class == [NSDate class]) {
                NSDate *date = nil;
                for (int i = 0; i < [arr count]; i++) {
                    id c = [arr objectAtIndex:i];
                    if ([c isKindOfClass:[NSDate class]]) {
                        if (date) {
                            if ([date compare:c] == NSOrderedAscending) {
                                date = c;
                            }
                        } else {
                            date = c;
                        }
                    }
                }
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"dd.MM.yyyy"];
                result = [formatter stringFromDate:date];
            }
            
            innerSelf.blockC(result);
        };
    }
    return _blockB;
}

@end
