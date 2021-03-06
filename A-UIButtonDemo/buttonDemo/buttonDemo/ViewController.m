//
//  ViewController.m
//  buttonDemo
//
//  Created by ZQD on 14-11-20.
//  Copyright (c) 2014年 ZQD. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+frame.h"

#define defaultFont10               [UIFont fontWithName:@"LantingHei SC" size:10]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //---------------
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 11;
    [btn setFrame:CGRectMake(100, 100, 200, 30)];
    btn.backgroundColor = [UIColor blackColor];
    [btn setImage:[UIImage imageNamed:@"best_icon"] forState:UIControlStateNormal];  //24x15
    
    //让button Title显示不全时，和左对齐显示效果一样的方法.
    NSUInteger breakLength;
    NSUInteger SCREEN_HEIGHT= [UIScreen mainScreen].bounds.size.height;
    if( SCREEN_HEIGHT<= 568){
        breakLength = 9;
    }else if(SCREEN_HEIGHT == 667){
        breakLength = 9;
    }else if(SCREEN_HEIGHT > 667) {
        breakLength = 9;
    }
    NSString *defaultAddressString = @"我是被测试的我是被测试的我是被测试撒旦法师打发斯蒂芬的";
    if (defaultAddressString.length > breakLength) {
        defaultAddressString = [defaultAddressString substringToIndex:breakLength];
        defaultAddressString = [NSString stringWithFormat:@"%@...",defaultAddressString];
    }
    
    [btn setTitle:defaultAddressString forState:UIControlStateNormal];
    btn.titleLabel.font = defaultFont10;
    [btn.titleLabel setBackgroundColor:[UIColor redColor]];
    btn.titleLabel.textAlignment   = NSTextAlignmentRight;
    
    //btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;    //AlignmentType Left
    [btn addTarget:self action:@selector(titleChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setImageLeft:24];
    [btn setTitleLeft:48];
    
    [self.view addSubview:btn];
    
 
    //---------------
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 12;
    [btn2 setFrame:CGRectMake(100, 150, 200, 30)];
    btn2.backgroundColor = [UIColor blackColor];
    [btn2 setImage:[UIImage imageNamed:@"best_icon"] forState:UIControlStateNormal];  //24x15
    [btn2 setTitle:@"我是被测试的2" forState:UIControlStateNormal];
    btn2.titleLabel.font = defaultFont10;
    [btn2.titleLabel setBackgroundColor:[UIColor redColor]];
    
    btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter; //AlignmentType Center
    [btn2 addTarget:self action:@selector(titleChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn2 setImageLeft:24];
    [btn2 setTitleLeft:48];
    [self.view addSubview:btn2];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(200, 150, 1, 30)];
    line.backgroundColor = [UIColor blackColor];
    [self.view addSubview:line];
    
    //---------------
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.tag = 13;
    [btn3 setFrame:CGRectMake(100, 200, 200, 30)];
    btn3.backgroundColor = [UIColor blackColor];
    [btn3 setImage:[UIImage imageNamed:@"best_icon"] forState:UIControlStateNormal];  //24x15
    [btn3 setTitle:@"我是被测试的3" forState:UIControlStateNormal];
    btn3.titleLabel.font = defaultFont10;
    [btn3.titleLabel setBackgroundColor:[UIColor redColor]];
    btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight; //AlignmentType Right
    [btn3 setImageLeft:24];
    [btn3 setTitleCenter];
    [btn3 addTarget:self action:@selector(titleChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn3];
    
    //---------------
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.tag = 14;
    [btn4 setFrame:CGRectMake(100, 250, 200, 30)];
    btn4.backgroundColor = [UIColor blackColor];
    [btn4 setImage:[UIImage imageNamed:@"best_icon"] forState:UIControlStateNormal];  //24x15
    [btn4 setTitle:@"hahahaha哈哈哈哈哈哈哈哈4" forState:UIControlStateNormal];
    btn4.titleLabel.font = defaultFont10;
    [btn4.titleLabel setBackgroundColor:[UIColor redColor]];
    btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter; //AlignmentType Center
      btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [btn4 addTarget:self action:@selector(titleChanged:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setimageToTitleRight];
    
    [self.view addSubview:btn4];
    
    
    //---------------
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.tag = 15;
    [btn5 setFrame:CGRectMake(100, 300, 200, 50)];
    btn5.backgroundColor = [UIColor blackColor];
    [btn5 setImage:[UIImage imageNamed:@"best_icon"] forState:UIControlStateNormal];  //24x15
    [btn5 setTitle:@"setImageToRight" forState:UIControlStateNormal];
    btn5.titleLabel.font = defaultFont10;
    [btn5.titleLabel setBackgroundColor:[UIColor redColor]];
    [btn5 addTarget:self action:@selector(titleChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight; //AlignmentType Right
    [btn5 setImageAndTitleCenterImageTopWithpadding:3];
    
    [self.view addSubview:btn5];
    
    //---------------
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.tag = 16;
    [btn6 setFrame:CGRectMake(100, 360, 200, 50)];
    btn6.backgroundColor = [UIColor blackColor];
    [btn6 setImage:[UIImage imageNamed:@"best_icon"] forState:UIControlStateNormal];  //24x15
    [btn6 setTitle:@"setImageToRight" forState:UIControlStateNormal];
    btn6.titleLabel.font = defaultFont10;
    [btn6.titleLabel setBackgroundColor:[UIColor redColor]];
    [btn6 addTarget:self action:@selector(titleChanged:) forControlEvents:UIControlEventTouchUpInside];
    btn6.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; //AlignmentType Left
    
    [btn6 setImageAndTitleCenterTitleTopWithpadding:5];
    
    [self.view addSubview:btn6];

}

-(void)titleChanged:(UIButton *)sender{
    
    if (sender.tag == 13 || sender.tag == 11 || sender.tag == 12) {
        [sender setTitle:@"haha" forState:UIControlStateNormal];
        [sender setImageLeft:24];
        [sender setTitleCenter];
    }
    
    if (sender.tag == 14) {
        [sender setTitle:@"setImageToRight" forState:UIControlStateNormal];
        [sender setimageToTitleRight];
    }
    
    if (sender.tag == 15) {
        [sender setTitle:@"haha" forState:UIControlStateNormal];
        [sender setImageAndTitleCenterImageTopWithpadding:3];
    }
    
    if (sender.tag == 16) {
        [sender setTitle:@"haha" forState:UIControlStateNormal];
        [sender setImageAndTitleCenterTitleTopWithpadding:5];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
