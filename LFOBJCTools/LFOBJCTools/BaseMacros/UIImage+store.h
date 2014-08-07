//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.//

#import <Foundation/Foundation.h>


@interface UIImage (Store)

+ (BOOL)writeImage:(UIImage*)image toFileAtPath:(NSString*)aPath;

@end
