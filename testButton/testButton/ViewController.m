//
//  ViewController.m
//  testButton
//
//  Created by hyh on 16/1/8.
//  Copyright © 2016年 hyh. All rights reserved.
//

#import "ViewController.h"
#import "YLCommon.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *testButton;

@property (strong, nonatomic)  UIButton *aBtn;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark First
    //这段代码动态的创建了一个UIButton,并且把相关常用的属性都列举了.希望对大家有用.
    //这里创建一个圆角矩形的按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // 能够定义的button类型有以下6种，
    // typedef enum {
    // UIButtonTypeCustom = 0, 自定义风格
    // UIButtonTypeRoundedRect, 圆角矩形
    // UIButtonTypeDetailDisclosure, 蓝色小箭头按钮，主要做详细说明用
    // UIButtonTypeInfoLight, 亮色感叹号
    // UIButtonTypeInfoDark, 暗色感叹号
    // UIButtonTypeContactAdd, 十字加号按钮
    // } UIButtonType;
    //给定button在view上的位置
    button1.frame = CGRectMake(20, 20, 280, 40);
    
    //button背景色
    button1.backgroundColor = [UIColor clearColor];
    
    //设置button填充图片
    //[button1 setImage:[UIImage imageNamed:@"btng.png"] forState:UIControlStateNormal];
    
    //设置button标题
    [button1 setTitle:@"点击" forState:UIControlStateNormal];
    
    
    /* forState: 这个参数的作用是定义按钮的文字或图片在何种状态下才会显现*/
    //以下是几种状态
    // enum {
    // UIControlStateNormal = 0, 常规状态显现
    // UIControlStateHighlighted = 1 << 0, 高亮状态显现
    // UIControlStateDisabled = 1 << 1, 禁用的状态才会显现
    // UIControlStateSelected = 1 << 2, 选中状态
    // UIControlStateApplication = 0x00FF0000, 当应用程序标志时
    // UIControlStateReserved = 0xFF000000 为内部框架预留，可以不管他
    // };
    
    /*
     * 默认情况下，当按钮高亮的情况下，图像的颜色会被画深一点，如果这下面的这个属性设置为no，
     * 那么可以去掉这个功能
     */
    button1.adjustsImageWhenHighlighted = NO;
    /*跟上面的情况一样，默认情况下，当按钮禁用的时候，图像会被画得深一点，设置NO可以取消设置*/
    button1.adjustsImageWhenDisabled = NO;
    /* 下面的这个属性设置为yes的状态下，按钮按下会发光*/
    button1.showsTouchWhenHighlighted = YES;
    
    /* 给button添加事件，事件有很多种，我会单独开一篇博文介绍它们，下面这个时间的意思是
     按下按钮，并且手指离开屏幕的时候触发这个事件，跟web中的click事件一样。
     触发了这个事件以后，执行butClick:这个方法，addTarget:self 的意思是说，这个方法在本类中
     也可以传入其他类的指针*/
    [button1 addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //显示控件
    [self.view addSubview:button1];
    
    //注意：
    [button1 addTarget:self
                action:@selector(alarmTimeDone:)
      forControlEvents:UIControlEventTouchUpInside
     ];

    
    //取消按钮已经添加的所有事件:(这个比较重要,若添加了两个事件  两个事件都会被触发)
    //[btn removeTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    
    //    何时释放release UIButton?
    //    是否在dealloc中对UIButton对象进行release操作，取决于UIButton初始化的方式。
    //    如果使用[UIButtonbuttonWithType:UIButtonTypeRoundedRect]这种方式，是不需要进行release操作的，因为这种方式是自动释放的。如果使用 [[UIButton alloc]init]的方式，则需要主动进行release释放操作。
    
    
    //设置边框颜色，必须同时设置边框宽度才行
    _testButton.layer.borderColor = [UIColor blueColor].CGColor;
    [_testButton.layer setBorderWidth:1.0];
    [self.view addSubview:_testButton];
    
#pragma mark Two
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(SCREEN_WIDTH - 20.0f - 30.0f, SCREEN_HEIGHT - 50.0f, 30.0f, 50.0f);
    btn.backgroundColor = [UIColor blueColor];
    
    // UIControlEventTouchDragInside
    // UIControlEventTouchDragOutside
    
    [btn addTarget:self action:@selector(dragInside) forControlEvents:UIControlEventTouchDragInside];
    [btn addTarget:self action:@selector(dragOutside) forControlEvents:UIControlEventTouchDragOutside];
    // dismissView
    [btn addTarget:self action:@selector(upInside) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
#pragma mark Three
    
    _aBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_aBtn setFrame:CGRectMake(40, 100, 60, 60)];
    _aBtn.backgroundColor = [UIColor redColor];
    
    //设置title距离左边的距离
    _aBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_aBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [_aBtn setTitle:@"test" forState:UIControlStateNormal];
    //[aBtn setBackgroundImage:[UIImage imageNamed:@"111.png"]forState:UIControlStateNormal];
    //button点击事件
    [_aBtn addTarget:self action:@selector(btnShort)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_aBtn];
    //button长按事件
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLong:)];
    longPress.minimumPressDuration = 0.8; //定义按的时间
    [_aBtn addGestureRecognizer:longPress];

    
#pragma mark 设置边框、圆角 这种情况就会有点击button，button变暗的效果
    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 300, 50, 50)];
    testButton.backgroundColor = [UIColor blueColor];
    testButton.layer.cornerRadius = testButton.frame.size.width/2.0;
    testButton.layer.masksToBounds = testButton.frame.size.width/2.0;  //这句必须
    testButton.titleLabel.text = @"test";
    [testButton setTitle:@"BBB" forState:UIControlStateNormal];
    [self.view addSubview:testButton];
    
    UIButton *testButtonTwo = [[UIButton alloc] initWithFrame:CGRectMake(30, 70, 50, 50)];
    [testButtonTwo setImage:[UIImage imageNamed:@"right_menu_payMoney"] forState:UIControlStateNormal];
    [testButtonTwo setImage:[UIImage imageNamed:@"right_menu_facetoface"] forState:UIControlStateSelected];
    [testButtonTwo addTarget:self action:@selector(testButtonTwoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButtonTwo];
    
}



#pragma mark ButtonClickAction

- (void ) testButtonTwoAction: (UIButton *)button {
    button.selected = !button.selected;
    
    
}

- (void ) btnShort{
    NSLog(@"btnShort...");
        [_aBtn setFrame:CGRectMake(40, 100, 100, 100)];
}

- (void)butClick:(UIButton *)btn{
    NSLog(@"butClick...");
}

- (void)alarmTimeDone:(UIButton *)btn{
     NSLog(@"alarmTimeDone...");
}

- (void)dragInside
{
    NSLog(@"dragInside...");
}

- (void)dragOutside
{
    NSLog(@"dragOutside...");
}
- (void)upInside
{
    NSLog(@"upInside...");
}

-(void)btnLong:(UILongPressGestureRecognizer*)gestureRecognizer{
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        
        NSLog(@"长按事件");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"消息" message:@"确定删除该模式吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"删除", nil, nil];
        [alert show];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
