//
//  LFObjcTools.h
//  LFOBJCTools
//
//  Created by Vincent on 14-8-6.
//  Copyright (c) 2014年 Vicent. All rights reserved.//

#import "UITextViewAdditions.h"

@implementation UITextView (Addtions)

- (void) insertString: (NSString *) insertingString  
{  
    NSRange range = self.selectedRange;  
    NSString * firstHalfString = [self.text substringToIndex:range.location];  
    NSString * secondHalfString = [self.text substringFromIndex: range.location + range.length];  
    self.scrollEnabled = NO;  // turn off scrolling or you'll get dizzy ... I promise  
	
    self.text = [NSString stringWithFormat: @"%@%@%@",  
					 firstHalfString,  
					 insertingString,  
					 secondHalfString];  
    //range.length = [insertingString length];  
    range.location = range.location + [insertingString length];
	range.length = 0;
	self.scrollEnabled = YES;  // turn scrolling back on.  
    self.selectedRange = range;  
	
}

@end
