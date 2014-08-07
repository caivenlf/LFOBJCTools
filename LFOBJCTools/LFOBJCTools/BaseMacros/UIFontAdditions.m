//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.

#import "UIFontAdditions.h"


/**
 * Additions.
 */
@implementation UIFont (Additions)


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)LineHeight {
	return (self.ascender - self.descender) + 1;
}

@end
