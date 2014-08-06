//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.


/***********************************************************
 *
 *
 *          NSDATA 增加 MD5 加密
 *
 *
 ***********************************************************/


#import <Foundation/Foundation.h>

@interface NSData (Addtions)

/**
 * Calculate the md5 hash of this data using CC_MD5.
 *
 * @return md5 hash of this data
 */
@property (nonatomic, readonly) NSString* md5Hash;


@end