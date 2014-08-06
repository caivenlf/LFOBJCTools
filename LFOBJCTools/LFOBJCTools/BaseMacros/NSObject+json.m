//
//  NSObject+json.m
//  NewZhiyou
//
//  Created by user on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NSObject+json.h"

/* http传输过来的数据为nil时，是NULL 这里统一处理为nil */

@implementation NSObject (NSObject_json)

- (NSArray*)packageSysObject:(NSString*) key
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:2];
    
    if (nil == self) {
        [result addObject:[NSNull null]];
    } else {
        [result addObject:self];
    }
    
    [result addObject:key];
    
    return result;
}

@end

@implementation NSArray (NSArray_json)

- (void)setUpDic:(NSMutableDictionary*) dic
{
    [dic setObject:[self objectAtIndex:0] forKey:[self objectAtIndex:1]];
}

@end


//////////////////////////////////////////////////////////////////////////////////////////////
// 解析json
//////////////////////////////////////////////////////////////////////////////////////////////

/* 解析int */
NSInteger parseInt(NSDictionary *dic, NSString *key)
{
    NSString *str = [dic objectForKey:key];
    NSInteger result = 0;
    if ((NSNull*)str != [NSNull null]) {
        result = [str integerValue];
    }
    
    return result;
}

/* 解析long */
long parseLong(NSDictionary *dic, NSString *key)
{
    NSString *str = [dic objectForKey:key];
    long result = 0;
    if ((NSNull*)str != [NSNull null]) {
        result = [str longLongValue];
    }
    
    return result;
}

/* 解析BOOL */
BOOL parseBool(NSDictionary *dic, NSString *key)
{
    NSString *str = [dic objectForKey:key];
    BOOL result = NO;
    if ((NSNull*)str != [NSNull null]) {
        result = [str boolValue];
    }
    
    return result;
}

/* 解析Float */
CGFloat parseFloat(NSDictionary *dic, NSString *key)
{
    NSString *str = [dic objectForKey:key];
    CGFloat result = .0f;
    if ((NSNull*)str != [NSNull null]) {
        result = [str floatValue];
    }
    
    return result;
}

/* NSDate */
@implementation NSDate (parseJson) 

+ (NSDate*)parseDic:(NSDictionary*)dic keyString:(NSString*) key
{
    NSDate *time = nil;
    NSString *timeStr = [dic objectForKey:key];
    if (timeStr != nil && (NSNull*)timeStr != [NSNull null]) {
        time = [NSDate dateWithTimeIntervalSince1970:([timeStr doubleValue] / 1000.0f)];
    }
    
    return time;
}

@end


/* NSString */
@implementation NSString (parseJson) 

+ (NSString*)parseDic:(NSDictionary*)dic keyString:(NSString*) key
{
    NSString *str = [dic objectForKey:key];
    if (str != nil && (NSNull*)str != [NSNull null] && ![str isEqualToString:@""]) {
        return str;
    }
    
    return nil;
}

@end

/* NSArray */
@implementation NSArray (parseJson) 

+ (NSArray*)parseDic:(NSDictionary*)dic keyString:(NSString*) key
{
    id object = [dic objectForKey:key];
    if ([object isKindOfClass:[NSArray class]])
    {
        NSArray *array = [dic objectForKey:key];
        if (array != nil && (NSNull*)array != [NSNull null] && array.count != 0) {
            
            if (array.count == 1) {
                if ((NSNull *)[array objectAtIndex:0] == [NSNull null] || ([[array objectAtIndex:0] isKindOfClass:[NSString class]] && [[array objectAtIndex:0] isEqual:@""])) {
                    array = nil;
                }
            }
            
            return array;
        }
    }
   
    return nil;
}

@end

/* NSDictionary */
@implementation NSDictionary (parseJson) 

+ (NSDictionary*)parseDic:(NSDictionary*)dic keyString:(NSString*) key
{
    id dictionary = [dic objectForKey:key];
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        if (dictionary != nil && (NSNull*)dictionary != [NSNull null]) {
            return dictionary;
        }
    }
    
    return nil;
}

@end
