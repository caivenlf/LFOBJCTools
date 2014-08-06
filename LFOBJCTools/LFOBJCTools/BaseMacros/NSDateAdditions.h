//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.



/***********************************************************
 *
 *
 *          DATE OPERATION
 *
 *
 ***********************************************************/



#import <Foundation/Foundation.h>

typedef enum tag_BREAK_TYPE_E
{
    BREAK_YEAR,
    BREAK_MONTH,
    BREAK_DAY,
    BREAK_HOUR,
    BREAK_MINUTE,
    BREAK_SECOND,
    BREAK_MAX
}BREAK_TYPE_E;


@interface NSDate (NSDateAdditions)

/*
 a:	AM/PM (上午/下午)
 
 A:	0~86399999 (一天的第A微秒)
 
 c/cc:	1~7 (一周的第一天, 周天为1)
 
 ccc:	Sun/Mon/Tue/Wed/Thu/Fri/Sat (星期几简写)
 
 cccc:	Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday (星期几全拼)
 
 d:	1~31 (月份的第几天, 带0)
 
 D:	1~366 (年份的第几天,带0)
 
 e:	1~7 (一周的第几天, 带0)
 
 E~EEE:	Sun/Mon/Tue/Wed/Thu/Fri/Sat (星期几简写)
 
 EEEE:	Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday (星期几全拼)
 
 F:	1~5 (每月的第几周, 一周的第一天为周一)
 
 g:	Julian Day Number (number of days since 4713 BC January 1) 未知
 
 G~GGG:	BC/AD (Era Designator Abbreviated) 未知
 
 GGGG:	Before Christ/Anno Domini 未知
 
 h:	1~12 (0 padded Hour (12hr)) 带0的时, 12小时制
 
 H:	0~23 (0 padded Hour (24hr))  带0的时, 24小时制
 
 k:	1~24 (0 padded Hour (24hr) 带0的时, 24小时制
 
 K:	0~11 (0 padded Hour (12hr)) 带0的时, 12小时制
 
 L/LL:	1~12 (0 padded Month)  第几月
 
 LLL:	Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec 月份简写
 
 LLLL: January/February/March/April/May/June/July/August/September/October/November/December 月份全称
 
 m:	0~59 (0 padded Minute) 分钟
 
 M/MM:	1~12 (0 padded Month) 第几月
 
 MMM:	Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec
 
 MMMM: January/February/March/April/May/June/July/August/September/October/November/December
 
 q/qq:	1~4 (0 padded Quarter) 第几季度
 
 qqq:	Q1/Q2/Q3/Q4 季度简写
 
 qqqq:	1st quarter/2nd quarter/3rd quarter/4th quarter 季度全拼
 
 Q/QQ:	1~4 (0 padded Quarter) 同小写
 
 QQQ:	Q1/Q2/Q3/Q4 同小写
 
 QQQQ:	1st quarter/2nd quarter/3rd quarter/4th quarter 同小写
 
 s:	0~59 (0 padded Second) 秒数
 
 S:	(rounded Sub-Second) 未知
 
 u:	(0 padded Year) 未知
 
 v~vvv:	(General GMT Timezone Abbreviation) 常规GMT时区的编写
 
 vvvv:	(General GMT Timezone Name) 常规GMT时区的名称
 
 w:	1~53 (0 padded Week of Year, 1st day of week = Sunday, NB: 1st week of year starts from the last Sunday of last year) 一年的第几周, 一周的开始为周日,第一周从去年的最后一个周日起算
 
 W:	1~5 (0 padded Week of Month, 1st day of week = Sunday) 一个月的第几周
 
 y/yyyy:	(Full Year) 完整的年份
 
 yy/yyy:	(2 Digits Year)  2个数字的年份
 
 Y/YYYY:	(Full Year, starting from the Sunday of the 1st week of year) 这个年份未知干嘛用的
 
 YY/YYY:	(2 Digits Year, starting from the Sunday of the 1st week of year) 这个年份未知干嘛用的
 
 z~zzz:	(Specific GMT Timezone Abbreviation) 指定GMT时区的编写
 
 zzzz:	(Specific GMT Timezone Name) Z:	+0000 (RFC 822 Timezone) 指定GMT时区的名称
 */

/**
    从string到nsdate
 */
+ (NSDate *)getDateFromString:(NSString *)dateStr andFormatStr:(NSString *)format;

/**
    从nsdate得到string 
 */
- (NSString *)formatDateString:(NSString *)formatterStr;

/**
    得到几天之后或之前的date 
 */
- (NSDate*)getSpecifyDate:(NSInteger) breaks andType:(BREAK_TYPE_E) breakType;

/**
    计算两个日期之间有多少天 不足一天按一天算
 */
- (NSInteger)calcDaysSinceDate:(NSDate*) aDate;

/**
    判断日期是否是同一天的 
 */
- (BOOL)checkIsSameDay:(NSDate*) date;

/**
    返回两个日期之间的间距 (toDate - self) default flags = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit 
 */
- (NSDateComponents *)getIntervalToDate:(NSDate *)toDate flags:(NSInteger)unitFlags;

/**
    返回两个日期直接的间距 
 */
- (NSDateComponents *)getIntervalToDateStr:(NSString *)toDateStr flags:(NSInteger)unitFlags;

/**
    1表示周日，2表示周一，以此类推。 
 */
- (int)getWhatDayOfDate;

/**
    返回当前日期是这个月的第几周 1表示第一周，2表示第二周，3表示第三周
 */
- (int)getWhatWeekOfDate;

/** 返回当前日期月份的月初和月末的日期
 *
 *  @para    返回值为:(firstDay,lastDay)
 *
 */
- (NSArray*)getFirstAndLastDayOfThisMonth;

/** 返回当前日期上个月月份的月初和月末的日期 
 *
 *  @para    返回值为:(firstDay,lastDay)
 *
 */
- (NSArray*)getFirstAndLastDayOfLastMonth;


@end
