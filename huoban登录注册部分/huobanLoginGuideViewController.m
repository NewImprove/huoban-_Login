//
//  huobanLoginGuideViewController.m
//  huoban登录注册部分
//
//  Created by 马锦航 on 15/12/17.
//  Copyright © 2015年 马锦航. All rights reserved.
//

#import "huobanLoginGuideViewController.h"

#import "huobanLoginViewController.h"
#import "huobanRegisterViewController.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface huobanLoginGuideViewController ()

@property (nonatomic,strong) UIButton * Login;

@property (nonatomic,strong) UIButton * Register;

@end

@implementation huobanLoginGuideViewController

- (UIButton *)Register {
    if (!_Register) {
        
        
        //当注册为圆形时候的坐标
        _Register = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80 - 24,self.Login.frame.origin.y - 80 - 24, 80, 80)];
        //        _Register = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80 - 24,self.Login.frame.origin.y - 80 - 24, 80, 80)];
        [_Register setBackgroundColor:[UIColor yellowColor]];
        [_Register setTitle:@"注册" forState:UIControlStateNormal];
        [_Register setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_Register addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
        
#pragma mark 添加圆角
#if 0
        _Register.layer.borderColor = [UIColor blackColor].CGColor;
        _Register.layer.borderWidth = 0.5;
        _Register.layer.cornerRadius = 40;
#endif
    }
    return _Register;
}

-(UIButton *)Login {
    if (!_Login) {
        //        _Login = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80 - 24,self.Register.frame.origin.y - 80 - 24, 80, 80)];
        _Login = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 80 - 24, SCREEN_HEIGHT - 80 - 49 - 24, 80, 80)];
        
        [_Login setBackgroundColor:[UIColor blackColor]];
        [_Login setTitle:@"登录" forState:UIControlStateNormal];
        [_Login setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        _Login.layer.cornerRadius = 40;
        [_Login addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _Login;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //模拟tabBar高度
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [button setTitle:@"TableBar｜高度：49PX" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:button];
    
    //修改navigation样式
    [self setNavigationStyle];
    
    
    /*
     UIStatusBarStyleDefault                                     = 0, // Dark content, for use on light backgrounds
     UIStatusBarStyleLightContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1, // Light content, for use on dark backgrounds
     
     UIStatusBarStyleBlackTranslucent NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 1,
     UIStatusBarStyleBlackOpaque      NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 2,
     
     */
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    [self.view addSubview:self.Login];
    [self.view addSubview:self.Register];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void) loginAction:(UIButton *)sender {
    NSLog(@"登录");
    huobanLoginViewController * huobanLoginVC = [[huobanLoginViewController alloc]init];
    [self.navigationController pushViewController:huobanLoginVC animated:YES];
}

- (void) registerAction:(UIButton *)sender {
    NSLog(@"注册");
    huobanRegisterViewController * huobanRegisterVC = [[huobanRegisterViewController alloc]init];
    [self.navigationController pushViewController:huobanRegisterVC animated:YES];
    
}

- (void) setNavigationStyle {
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:21.0/255 green:30.0/255 blue:40.0/255 alpha:1]];
    
    //修改导航栏偏色
    self.navigationController.navigationBar.translucent = NO;
    
    //图片保持原有颜色不改变，不做处理的话，图片会被强制渲染成蓝色
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"系统设置"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:nil];
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"我_私信"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.title = @"金霖";
    //设置navigationItem.title的颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:170 green:170 blue:170 alpha:1.0] forKey:UITextAttributeTextColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
