//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.

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



NSInteger parseInt(NSDictionary *dic, NSString *key);
long parseLong(NSDictionary *dic, NSString *key);
BOOL parseBool(NSDictionary *dic, NSString *key);
/* 解析Float */
CGFloat parseFloat(NSDictionary *dic, NSString *key);

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

@end