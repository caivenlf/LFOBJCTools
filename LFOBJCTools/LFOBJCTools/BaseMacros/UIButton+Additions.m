//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.

#import "UIButton+Additions.h"

@implementation UIButton (Additions)

+ (UIButton*)buttonWithNormalImg:(NSString*) normalimg activeImg:(NSString*) activeImg target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (normalimg) {
        UIImage *normal = [UIImage imageNamed:normalimg];
        [button setBackgroundImage:normal forState:UIControlStateNormal];
        button.frame = CGRectMake(0.0f, .0f, normal.size.width, normal.size.height);
    }
    
    if (activeImg) {
        [button setBackgroundImage:[UIImage imageNamed:activeImg] forState:UIControlStateHighlighted];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton*)buttonWithNormalImg:(NSString*) normalimg andText:(NSString*) text target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (normalimg) {
        UIImage *normal = [UIImage imageNamed:normalimg];
        [button setBackgroundImage:normal forState:UIControlStateNormal];
        button.frame = CGRectMake(0.0f, .0f, normal.size.width, normal.size.height);
    }
    
    if (text) {
        [button setTitle:text forState:UIControlStateNormal];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
