//
//  UIImage+store.h
//  NewZhiyou
//
//  Created by user on 11-8-31.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage (Store)

+ (BOOL)writeImage:(UIImage*)image toFileAtPath:(NSString*)aPath;

@end
