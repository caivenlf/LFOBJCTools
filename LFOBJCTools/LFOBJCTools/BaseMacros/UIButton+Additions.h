//
//  UIButton+Additions.h
//  NewZhiyou
//
//  Created by clyde yang on 11-11-5.
//  Copyright (c) 2011年 深圳市指优信息技术发展有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

+ (UIButton*)buttonWithNormalImg:(NSString*) normalimg activeImg:(NSString*) activeImg target:(id)target action:(SEL)action;
+ (UIButton*)buttonWithNormalImg:(NSString*) normalimg andText:(NSString*) text target:(id)target action:(SEL)action;

@end
