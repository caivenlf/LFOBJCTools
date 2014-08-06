//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.




/***********************************************************
 *
 *
 *          GET VALUE FROM DICTIONARY
 *
 *
 ***********************************************************/



#import <Foundation/Foundation.h>


@interface NSDictionary (Additions)

/*
 *  @para   add defaultValue for getting Value
 *
 */
- (BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

- (int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue;

- (time_t)getTimeValueForKey:(NSString *)key defaultValue:(time_t)defaultValue;

- (long long)getLongLongValueValueForKey:(NSString *)key defaultValue:(long long)defaultValue;

- (NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue;

@end
