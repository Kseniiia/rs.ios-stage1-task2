#import "Dates.h"

@implementation Dates

- (NSString *)getWeekdayText:(int)weekday {
    NSString *wday;
    
    switch (weekday) {
        case 1:
            wday = @"воскресенье";
            break;
        case 2:
            wday = @"понедельник";
            break;
        case 3:
            wday = @"вторник";
            break;
        case 4:
            wday = @"среда";
            break;
        case 5:
            wday = @"четверг";
            break;
        case 6:
            wday = @"пятница";
            break;
        case 7:
            wday = @"суббота";
            break;
        default:
            wday = @"";
            break;
    }
    
    return wday;
}

- (NSString *)getMonthText:(int)month {
    NSString *monthText;
    
    switch (month) {
        case 1:
            monthText = @"января";
            break;
        case 2:
            monthText = @"февраля";
            break;
        case 3:
            monthText = @"марта";
            break;
        case 4:
            monthText = @"апреля";
            break;
        case 5:
            monthText = @"мая";
            break;
        case 6:
            monthText = @"июня";
            break;
        case 7:
            monthText = @"июля";
            break;
        case 8:
            monthText = @"августа";
            break;
        case 9:
            monthText = @"сентября";
            break;
        case 10:
            monthText = @"октября";
            break;
        case 11:
            monthText = @"ноября";
            break;
        case 12:
            monthText = @"декабря";
            break;
            
        default:
            monthText = @"";
            break;
    }
    
    return monthText;
}

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    int dayInt = [day intValue];
    int monthInt = [month intValue];
    int yearInt = [year intValue];
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    [dateComponents setDay:dayInt];
    [dateComponents setMonth:monthInt];
    [dateComponents setYear:yearInt];
    
    BOOL b = [dateComponents isValidDateInCalendar:cal];
    
    if (b == false) {
        return @"Такого дня не существует";
    }
    
    NSDate *date = [cal dateFromComponents:dateComponents];
    NSDateComponents *comps = [cal components:NSCalendarUnitWeekday fromDate:date];
    int weekday = (int) [comps weekday];
    
    return [NSString stringWithFormat:@"%d %@, %@", dayInt, [self getMonthText:monthInt], [self getWeekdayText:weekday]];
}

@end
