//
//  DateToString.m
//  ChatDateToString
//
//  Created by kisekied on 15/10/29.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import "DateToString.h"

@implementation DateToString

+ (NSString *)stringWithDate:(NSDate *)date {
    
    float different = [date timeIntervalSinceNow];
//    NSLog(@"%f", different);
    
    if (different > 0) {
        return @"Time Error!";
    } else {
        
        // 当前时间
        NSDate *currentDate = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *currentComps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:currentDate];
        NSInteger currentYear = [currentComps year];
        NSInteger currentMonth = [currentComps month];
        NSInteger currentDay = [currentComps day];
        
        // 传入时间
        NSDateComponents *comps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
        NSInteger year = [comps year];
        NSInteger month = [comps month];
        NSInteger day = [comps day];
        NSInteger weekday = [comps weekday];
//        NSLog(@"year:%ld month: %ld, day: %ld", year, month, day);
        
        // 传入时间的时分
        comps =[calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute)
                           fromDate:date];
        NSInteger hour = [comps hour];
        NSInteger minute = [comps minute];
//        NSLog(@"hour:%ld minute: %ld", hour, minute);
        
        NSString *todayStr = [NSString stringWithFormat:@"%ld-%ld-%ld 23:59:59", currentYear, currentMonth, currentDay];
        different = - [date timeIntervalSinceDate:[DateToString dateFromString:todayStr]];
        float dayDifferent = floor(different / 86400);
        
        if (dayDifferent < 1) {
            return [NSString stringWithFormat:@"%.2ld:%.2ld", hour, minute];
        } else if (dayDifferent < 2) {
            return [NSString stringWithFormat:@"昨天 %.2ld:%.2ld", hour, minute];
        } else if (dayDifferent < 7) {
            NSString *weekdayStr = [NSString string];
            switch (weekday) {
                case 1:
                    weekdayStr = @"星期日";
                    break;
                    
                case 2:
                    weekdayStr = @"星期一";
                    break;
                    
                case 3:
                    weekdayStr = @"星期二";
                    break;
                    
                case 4:
                    weekdayStr = @"星期三";
                    break;
                    
                case 5:
                    weekdayStr = @"星期四";
                    break;
                    
                case 6:
                    weekdayStr = @"星期五";
                    break;
                    
                case 7:
                    weekdayStr = @"星期六";
                    break;
                    
                default:
                    break;
            }
            return [NSString stringWithFormat:@"%@ %.2ld:%.2ld", weekdayStr, hour, minute];
        } else if (year == currentYear) {
            return [NSString stringWithFormat:@"%ld-%ld %.2ld:%.2ld", month, day, hour, minute];
        } else {
            return [NSString stringWithFormat:@"%ld-%ld-%ld %.2ld:%.2ld", year, month, day, hour, minute];
        }
    }
    
    
}

+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

@end
