//
//  ViewController.m
//  LFOBJCTools
//
//  Created by Vincent on 14-8-5.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "ViewController.h"
#import "UIFontAdditions.h"
typedef enum{
    
    First,Second,Third,Forth
} enumTest;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *selfLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selfImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSDate *firstDate = [NSDate getDateFromString:@"2014-4-1" andFormatStr:@"yyyy-MM-dd"];
    NSDate *date = [[NSDate date] getSpecifyDate:-1 andType:BREAK_YEAR];
    NSString *dateStr = [date formatDateString:@"yyyy-qqq,hh-mm-ss"];
    DebugLog(@"%@",[firstDate getFirstAndLastDayOfLastMonth]);
    
    _selfImage.image = [[[UIImage alloc] init] maskWithColor:[UIColor blackColor] shadowColor:[UIColor redColor] shadowOffset:CGSizeMake(150, 150) shadowBlur:0.5];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
