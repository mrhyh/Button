//
//  ViewController.m
//  testImageView1
//
//  Created by ylgwhyh on 16/5/26.
//  Copyright © 2016年 hyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 200 ,200)];
//    imageView1.bounds = CGRectMake( 0,  0,  200, 200 );
    //imageView1.image = [UIImage imageNamed:@"2.jpg"];
    [imageView1 setImage:[UIImage imageNamed:@"suitable.jpg"]];
    //imageView1.backgroundColor = [UIColor redColor];
    imageView1.contentMode = UIViewContentModeScaleToFill;
    //imageView1.contentMode = UIViewContentModeCenter;

    [self.view addSubview:imageView1];
    
    CGRect tempRect = imageView1.frame;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 50, 100)];
    imageView2.image = [UIImage imageNamed:@"2.jpg"];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView2];
    
//    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
//    imageView3.backgroundColor = [UIColor grayColor];
//    imageView3.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imageView3];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 20, 20)];
    label.text = @"09";
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor grayColor];
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    [self.view addSubview:label];
    
    
//    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
//    testButton.titleLabel.text = @"09";
//    testButton.backgroundColor = [UIColor grayColor];
//    [testButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    testButton.layer.cornerRadius = 10;
//    [self.view addSubview:testButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
