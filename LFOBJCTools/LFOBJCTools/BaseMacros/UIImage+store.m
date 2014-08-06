//
//  UIImage+store.m
//  NewZhiyou
//
//  Created by user on 11-8-31.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIImage+store.h"


@implementation UIImage (Store)

+ (BOOL)writeImage:(UIImage*)image toFileAtPath:(NSString*)aPath
{
    if ((image == nil) || (aPath == nil) || ([aPath isEqualToString:@""]))
        return NO;
    
    @try
    {
        NSData *imageData = nil;
        NSString *ext = [aPath pathExtension];
        if ([ext isEqualToString:@"png"])
        {
            imageData = UIImagePNGRepresentation(image);
        }
        else
        {
            // the rest, we write to jpeg
            // 0. best, 1. lost. about compress.
            imageData = UIImageJPEGRepresentation(image, 0);    
        }
        
        if ((imageData == nil) || ([imageData length] <= 0))
            return NO;
        
        [imageData writeToFile:aPath atomically:YES];      
        return YES;
    }
    @catch (NSException *e)
    {
        NSLog(@"create thumbnail exception.");
    }
    
    return NO;
}

@end
