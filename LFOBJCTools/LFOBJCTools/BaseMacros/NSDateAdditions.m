//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.

#import "NSDateAdditions.h"


@implementation NSDate (NSDateAdditions)

// 从string到nsdate
+ (NSDate *)getDateFromString:(NSString *)dateStr andFormatStr:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:dateStr];
}

/* 从nsdate得到string */
- (NSString*)formatDateString:(NSString*)formatterStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    NSString *dateStr = [formatter stringFromDate:self];
    return dateStr;
}

/* 得到几天之后或之前的date */
- (NSDate*)getSpecifyDate:(NSInteger) breaks andType:(BREAK_TYPE_E) breakType{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    switch (breakType) {
        case BREAK_YEAR:
            [comps setYear:breaks];
            break;
        case BREAK_MONTH:
            [comps setMonth:breaks];
            break;   
        case BREAK_DAY:
            [comps setDay:breaks];
            break;
        case BREAK_MINUTE:
            [comps setMinute:breaks];
            break;   
        case BREAK_HOUR:
            [comps setHour:breaks];
            break;   
        case BREAK_SECOND:
            [comps setSecond:breaks];
            break;   
        default:
            break;
    }
    
    NSDate *nextDate = [calendar dateByAddingComponents:comps toDate:self options:0];
    return nextDate;
}

/* 计算两个日期之间有多少天 不足一天按一天算*/
- (NSInteger)calcDaysSinceDate:(NSDate*) aDate{
    NSInteger result = 0;
    NSTimeInterval timeIntervals = [self timeIntervalSinceDate:aDate];
    if (timeIntervals != 0) {
        double days = timeIntervals / (24 * 60 * 60);
        result = (NSInteger)(days + 0.5);
    }
    
    return result;
}

/* 判断日期是否是同一天的 */
- (BOOL)checkIsSameDay:(NSDate*) date{
    BOOL result = NO;
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *component1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents *component2 = [calendar components:unitFlags fromDate:date];
    if (component1.year == component2.year && component1.month == component2.month && component1.day == component2.day) {
        result = YES;
    }
    return result;
}

// 返回两个日期之间的间距(toDate - self) default flags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit
- (NSDateComponents *)getIntervalToDate:(NSDate *)toDate flags:(NSInteger)unitFlags{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    if (unitFlags == 0) {
        unitFlags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
    }
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:toDate options:0];
    return components;
}

// 返回两个日期直接的间距
- (NSDateComponents *)getIntervalToDateStr:(NSString *)toDateStr flags:(NSInteger)unitFlags{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *toTime = [dateFormatter dateFromString:toDateStr];
    return [self getIntervalToDate:toTime flags:unitFlags];
}


- (int)getWhatDayOfDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    return (int)([comps weekday]==1)?8:(int)[comps weekday];
}


- (int)getWhatWeekOfDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    return (int)[comps weekdayOrdinal];
}


- (NSArray*)getFirstAndLastDayOfThisMonth{
    NSInteger year,month,day;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:self];
    year = [comps year];
    month = [comps month];
    day = [comps day];
    
    NSString *lastMonthLastDay;
    NSString *lastMonthFirstDay;
    
    NSString *monthStr;
    if (month<10) {
        monthStr = [NSString stringWithFormat:@"0%ld",month];
    }else{
        monthStr = [NSString stringWithFormat:@"%ld",month];
    }
    
    if (month!=12) {
        lastMonthFirstDay = [NSString stringWithFormat:@"%ld-%@-01",year,monthStr];
        if (month!=2) {
            if (month==1 || month==3 || month == 5 || month==7 || month==8 || month ==10 || month ==12) {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-31",year,monthStr];
            }
            else {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-30",year,monthStr];
            }
        }
        else {
            if ((year%4==0 && year%100!=0) || year%400==0) {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-29",year,monthStr];
            }
            else {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-28",year,monthStr];
            }
        }
    }
    else {
        lastMonthFirstDay = [NSString stringWithFormat:@"%ld-12-01",year];
        lastMonthLastDay = [NSString stringWithFormat:@"%ld-12-31",year];
    }
    NSArray *lastMonthArray = @[lastMonthFirstDay,lastMonthLastDay];
    return lastMonthArray;
}

- (NSArray*)getFirstAndLastDayOfLastMonth{
    NSInteger year,month,day;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps = [calendar components:unitFlags fromDate:self];
    year = [comps year];
    month = [comps month];
    day = [comps day];
    
    NSString *lastMonthLastDay;
    NSString *lastMonthFirstDay;
    
    NSString *monthStr;
    if (month<10) {
        monthStr = [NSString stringWithFormat:@"0%ld",month-1];
    }else{
        monthStr = [NSString stringWithFormat:@"%ld",month-1];
    }
    
    if (month!=1) {
        lastMonthFirstDay = [NSString stringWithFormat:@"%ld-%@-01",year,monthStr];
        if (month!=3) {
            //如果上个月的月份为 4  6  9  11 月份，他们月末是30号
            if (month==1 || month==3 || month == 5 || month==7 || month==8 || month ==10 || month ==12) {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-31",year,monthStr];
            }
            else {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-30",year,monthStr];
            }
        }
        //        如果本月是3月份，上个月为为2月份，闰年2月月末29天，非闰年28天
        else {
            if ((year%4==0 && year%100!=0) || year%400==0) {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-29",year,monthStr];
            }
            else {
                lastMonthLastDay = [NSString stringWithFormat:@"%ld-%@-28",year,monthStr];
            }
        }
        
    }
    //    如果当前月份是1月，上个月份就是12月  year-1,month=12
    else {
        lastMonthFirstDay = [NSString stringWithFormat:@"%ld-12-01",year-1];
        lastMonthLastDay = [NSString stringWithFormat:@"%ld-12-31",year-1];
    }
    NSArray *lastMonthArray = @[lastMonthFirstDay,lastMonthLastDay];
    return lastMonthArray;
}

@end
