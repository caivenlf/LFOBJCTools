// http://www.cocoadev.com/index.pl?BaseSixtyFour

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
 
@interface NSData (Base64)

+ (id)dataWithBase64EncodedString:(NSString *)string;     //  Padding '=' characters are optional. Whitespace is ignored.
- (NSString *)base64Encoding;

@end