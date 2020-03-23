#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function

- (NSString*)numberToText:(int)num {
    NSString *numText;
    NSArray *smallNums = [NSArray arrayWithObjects:@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", nil];
    NSArray *tens = [NSArray arrayWithObjects:@"", @"", @"twenty", @"thirty", @"forty", @"fifty", @"sixty", nil];
   
    int t = num / 10;
    int u = num % 10;
    
    if (num < 20) {
        numText = smallNums[num];
    } else {
        numText = tens[t];
        if (u != 0) {
            numText = [numText stringByAppendingString:@" "];
            numText = [numText stringByAppendingString:smallNums[u]];
        }
    }
    
    return numText;
}

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    int hoursInt = [hours intValue];
    int minutesInt = [minutes intValue];
    
    if (minutesInt == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", [self numberToText:hoursInt]];
    }
    
    if (minutesInt == 15) {
        return [NSString stringWithFormat:@"quarter past %@", [self numberToText:hoursInt]];
    }
    
    if (minutesInt == 30) {
        return [NSString stringWithFormat:@"half past %@", [self numberToText:hoursInt]];
    }
    
    if (minutesInt == 45) {
        return [NSString stringWithFormat:@"quarter to %@", [self numberToText:hoursInt + 1]];
    }
    
    if (minutesInt == 1) {
        return [NSString stringWithFormat:@"%@ minute past %@", [self numberToText:minutesInt], [self numberToText:hoursInt]];
    }
    
    if (minutesInt > 1 && minutesInt < 30) {
        return [NSString stringWithFormat:@"%@ minutes past %@", [self numberToText:minutesInt], [self numberToText:hoursInt]];
    }
    
    if (minutesInt > 30 && minutesInt < 60) {
        return [NSString stringWithFormat:@"%@ minutes to %@", [self numberToText:60 - minutesInt], [self numberToText:hoursInt + 1]];
    }
    
    return @"";
}
@end
