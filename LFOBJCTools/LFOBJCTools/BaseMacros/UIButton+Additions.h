//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

+ (UIButton*)buttonWithNormalImg:(NSString*) normalimg activeImg:(NSString*) activeImg target:(id)target action:(SEL)action;
+ (UIButton*)buttonWithNormalImg:(NSString*) normalimg andText:(NSString*) text target:(id)target action:(SEL)action;

@end
