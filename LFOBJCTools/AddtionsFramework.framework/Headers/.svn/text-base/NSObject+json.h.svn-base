//
//  NSObject+json.h
//  NewZhiyou
//
//  Created by user on 11-8-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define PACKAGE_INT(dic ,value, key) [dic setObject:[NSNumber numberWithInt:value] forKey:key]
#define PACKAGE_BOOL(dic ,value, key) [dic setObject:[NSNumber numberWithBool:value] forKey:key]
#define PACKAGE_LONG(dic ,value, key) [dic setObject:[NSNumber numberWithLong:value] forKey:key]
#define PACKAGE_LONGLONG(dic ,value, key) [dic setObject:[NSNumber numberWithLongLong:value] forKey:key]

@interface NSObject (NSObject_json)

- (NSArray*)packageSysObject:(NSString*) key;

@end


@interface NSArray (NSArray_json)

- (void)setUpDic:(NSMutableDictionary*) dic;

@end

/* NSDate */
@interface NSDate (parseJson) 

+ (NSDate*)parseDic:(NSDictionary*)dic keyString:(NSString*) key;

@end


/* NSString */
@interface NSString (parseJson) 

+ (NSString*)parseDic:(NSDictionary*)dic keyString:(NSString*) key;

@end

/* NSArray */
@interface NSArray (parseJson) 

+ (NSArray*)parseDic:(NSDictionary*)dic keyString:(NSString*) key;

@end

/* NSDictionary */
@interface NSDictionary (parseJson) 

+ (NSDictionary*)parseDic:(NSDictionary*)dic keyString:(NSString*) key;

/* 解析int */
- (NSInteger)parseInt:(NSString *)key;
/* 解析long */
- (long long)parseLong:(NSString *)key;
/* 解析BOOL */
- (BOOL)parseBool:(NSString *)key;
/* 解析Float */
- (CGFloat)parseFloat:(NSString *)key;
/* 解析double */
- (double)parseDouble:(NSString *)key;

@end

/* NSNumber */
@interface NSNumber (parseJson)

+ (NSNumber *)parseDic:(NSDictionary*)dic keyString:(NSString*) key;

@end