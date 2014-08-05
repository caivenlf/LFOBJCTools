//
//  Debug_Release.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-5.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#ifndef LFOBJCTools_Debug_Release_h
#define LFOBJCTools_Debug_Release_h

#endif




/**
    @para   DebugLog() put info in debug model / put no info in release model
 */
#pragma mark - NSLog
#ifdef DEBUG

    #define DebugLog(...) NSLog(__VA_ARGS__)
#else

    #define DebugLog(...)
#endif




/**
    @func   kColorFromHexA(hex, a) -> color from hex
    @func   kColorFromRGBA(r, g, b, a) -> color from RGB
        @para   hex: hexadecimal number
        @para   a: alpha value
        @para   r,g,b -> color value
    FX: #define kTitleClr kColorFromHex(0x313649)
*/
#pragma mark - Color
#define kColorFromHexA(hex, a) [UIColor colorWithRed:(((hex & 0xff0000) >> 16) / 255.0f) green:(((hex & 0x00ff00) >> 8) / 255.0f) blue:((hex & 0x0000ff) / 255.0f) alpha:(a)]

#define kColorFromHex(hex) [UIColor colorWithRed:(((hex & 0xff0000) >> 16) / 255.0f) green:(((hex & 0x00ff00) >> 8) / 255.0f) blue:((hex & 0x0000ff) / 255.0f) alpha:(1.0f)]

#define kColorFromRGBA(r, g, b, a) [UIColor colorWithRed:((r) / 255.0f) green:((g) / 255.0f) blue:((b) / 255.0f) alpha:(a)]

#define kColorFromRGB(r, g, b) [UIColor colorWithRed:((r) / 255.0f) green:((g) / 255.0f) blue:((b) / 255.0f) alpha:(1.0f)]





/**
    @func   kGetUserSystemObject(key) -> userdefault get value by key
    @func   kSaveUserSystemObject(key, value) -> save value for key
        @para   key,value -> userdefault's key and value
 */
#pragma mark - NSUserdefault
#define kGetUserSystemObject(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define kSaveUserSystemObject(key, value) \
[[NSUserDefaults standardUserDefaults] setObject:value forKey:key]; \
[[NSUserDefaults standardUserDefaults] synchronize]




/**
    @para   kSYSTEM_VERSION -> phone's system version
    @para   kScreenHeight -> height of phone's screen
    @para   kScreenWidth -> width of phone's screen
    @para   isInch4/(BOOL) -> is the inch4
 */
#pragma mark - Phone's info
#define kSYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)

#define isInch4 (kScreenHeight == 568.0f)










