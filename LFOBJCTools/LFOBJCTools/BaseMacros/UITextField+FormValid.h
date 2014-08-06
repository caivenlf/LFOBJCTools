//
//  UITextField+FormValid.h
//  PadNews
//
//  Created by yangxi on 12-12-27.
//  Copyright (c) 2012年 东莞市巨细信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (FormValid)
/////////////////////////// 表单验证 ////////////////////////////////
// 是否为空 不包含空格
- (BOOL)isEmpty;

// [min max]
- (BOOL)isCountInMin:(NSInteger)min andMax:(NSInteger)max;

// 邮件 需要引入正则库并在 additionsDefine开启宏
- (BOOL)isValidEmail;

// 电话号码
- (BOOL)isValidTelephone;

/** 手机号码验证 13*********|15*********|147**********|18
 
 ^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$
 */
- (BOOL)isValidPhone;

@end
