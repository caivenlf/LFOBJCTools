//
//  UITextField+FormValid.m
//  PadNews
//
//  Created by yangxi on 12-12-27.
//  Copyright (c) 2012年 东莞市巨细信息科技有限公司. All rights reserved.
//

#import "UITextField+FormValid.h"

#import "AdditionsDefine.h"

#ifdef kAdditionsRegexKitLite
#import "RegexKitLite.h"
#endif

@implementation UITextField (FormValid)
/////////////////////////// 表单验证 ////////////////////////////////
// 是否为空 不包含空格
- (BOOL)isEmpty
{
    NSString *text = [self.text stringByTrimmingLeadingWhitespaceAndNewlineCharacters];
    return ![text isNotEmpty];
}

// [min max]
- (BOOL)isCountInMin:(NSInteger)min andMax:(NSInteger)max
{
    BOOL result = NO;
    if ([self isEmpty]) {
        result = YES;
    } else {
        if (self.text.length >= min && self.text.length <= max) {
            result = YES;
        }
    }
    
    return result;
}

// 邮件
- (BOOL)isValidEmail
{
    BOOL result = YES;
#ifdef kAdditionsRegexKitLite
    if (![self.text isMatchedByRegex:@"^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$"]) {
        result = NO;
    }
#endif
    return result;
}

// 座机
- (BOOL)isValidTelephone
{
    BOOL result = YES;
#ifdef kAdditionsRegexKitLite
    if (![self.text isMatchedByRegex:@"^0\\d{2,3}(\\-)?\\d{7,8}$"]) {
        result = NO;
    }
#endif
    
    return result;
}

/** 手机号码验证 13*********|15*********|147**********|18
 
 ^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$
 */
- (BOOL)isValidPhone
{
    BOOL result = YES;
#ifdef kAdditionsRegexKitLite
    if (![self.text isMatchedByRegex:@"^(1(([35][0-9])|(47)|[8][01236789]))\\d{8}$"]) {
        result = NO;
    }
#endif
    
    return result;
}

@end
