//
//  RegisterViewController.m
//  huoban登录注册部分
//
//  Created by 马锦航 on 15/12/17.
//  Copyright © 2015年 马锦航. All rights reserved.
//

#import "RegisterViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface RegisterViewController ()

@property (nonatomic,strong) UITextField * huobanPhoneNum;

@property (nonatomic,strong) UITextField * huobanPassWorld;

@property (nonatomic,strong) UIView * loginView;

@property (nonatomic,strong) UIButton * loginButton;

@property (nonatomic,strong) UIView * huobanFootView;

@property (nonatomic,strong) UIButton * huobanFoundPassWorld;

@property (nonatomic,strong) UIButton * huobanRegister;



@end

@implementation RegisterViewController

#pragma mark - 懒加载

- (UITextField *)huobanPhoneNum {
    if (!_huobanPhoneNum) {
        _huobanPhoneNum = [[UITextField alloc]initWithFrame:CGRectMake(12, 0, SCREEN_WIDTH - 12*2, 60)];
        [_huobanPhoneNum setPlaceholder:@"手机号"];
        [_huobanPhoneNum setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        NSLog(@"%@",NSStringFromCGRect(_huobanPhoneNum.frame));
        
        //        [_huobanPhoneNum setBackgroundColor:[UIColor grayColor]];
    }
    return _huobanPhoneNum;
}

- (UITextField *)huobanPassWorld {
    if (!_huobanPassWorld) {
        _huobanPassWorld = [[UITextField alloc]initWithFrame:CGRectMake(12,self.huobanPhoneNum.frame.origin.y+self.huobanPhoneNum.frame.size.height, SCREEN_WIDTH - 12*2, 60)];
        NSLog(@"%@",NSStringFromCGRect(_huobanPassWorld.frame));
        [_huobanPassWorld setPlaceholder:@"密码"];
        [_huobanPassWorld setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
    }
    return _huobanPassWorld;
}


#pragma mark 中部登录视图

//320*568   navi 64 + 60 *3 + 36 +12 +
- (UIButton *)loginButton {
    if (!_loginButton) {
        NSInteger loginButtonHigth = 50;
        _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - loginButtonHigth/2 , 36, loginButtonHigth, loginButtonHigth)];
        [_loginButton setBackgroundColor:[UIColor redColor]];
        _loginButton.layer.cornerRadius = loginButtonHigth/2;
    }
    return _loginButton;
}

- (UIView *)loginView {
    if (!_loginView) {
        _loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT - 120 - 50 - 64)];
        [_loginView setBackgroundColor:[UIColor greenColor]];
        NSLog(@"mainScreen.bounds:%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
        [_loginView addSubview:self.loginButton];
    }
    return _loginView;
}


#pragma mark 底部视图
- (UIView *)huobanFootView {
    if (!_huobanFootView) {
        _huobanFootView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50 - 64, SCREEN_WIDTH, 50)];
        NSLog(@"footView.frame:%@",NSStringFromCGRect(_huobanFootView.frame));
        [_huobanFootView setBackgroundColor:[UIColor yellowColor]];
        [_huobanFootView addSubview:self.huobanFoundPassWorld];
        [_huobanFootView addSubview:self.huobanRegister];
    }
    return _huobanFootView;
}



- (UIButton *)huobanFoundPassWorld {
    if (!_huobanFoundPassWorld) {
        _huobanFoundPassWorld = [[UIButton alloc]initWithFrame:CGRectMake(12, 0, 100, 50)];
        [_huobanFoundPassWorld setTitle:@"找回密码" forState:UIControlStateNormal];
        [_huobanFoundPassWorld setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [_huobanFoundPassWorld setBackgroundColor:[UIColor greenColor]];
    }
    return _huobanFoundPassWorld;
    
}

- (UIButton *)huobanRegister {
    if (!_huobanRegister) {
        _huobanRegister = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 12 - 100, 0, 100, 50)];
        [_huobanRegister setTitle:@"注册" forState:UIControlStateNormal];
        [_huobanRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //        [_huobanRegister setBackgroundColor:[UIColor greenColor]];
    }
    return _huobanRegister;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    //添加电话号码文本框到当前视图
    [self.view addSubview:self.huobanPhoneNum];
    //添加密码文本框到当前视图
    [self.view addSubview:self.huobanPassWorld];
    //添加中部登录视图到当前视图
    [self.view addSubview:self.loginView];
    //添加底部footView到当前视图
    [self.view addSubview:self.huobanFootView];
    
    [self addUnderLineWithObject:self.huobanPhoneNum color:[UIColor redColor] hight:2 isMainScreenWidth:1];
    [self addUnderLineWithObject:self.huobanPassWorld color:[UIColor redColor] hight:2 isMainScreenWidth:1];
    [self addUnderLineWithObject:self.loginView color:[UIColor redColor] hight:2 isMainScreenWidth:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//给指定对象添加下划线的方法


/*
 * 给对象添加下划线的方法
 *
 * @param object  要添加下划线的对象
 * @param color   下划线的颜色
 * @param hight   下划线的高度
 * @param isMainScreenWith   下划线是否按照屏幕宽度
 */
- (void) addUnderLineWithObject:(id)object color:(UIColor *)color hight:(CGFloat)hight isMainScreenWidth:(NSInteger)isMainScreenWidth {
    NSInteger _lineWidth;
    NSInteger _hight;
    NSInteger _x;
    NSInteger _y;
    
    
    
    if ([object isKindOfClass:[UIView class]]) {
        UIView * _object = object;
        if (isMainScreenWidth == 1) {
            _lineWidth = SCREEN_WIDTH;
            _x = 0;
        }
        else {
            _lineWidth = _object.frame.size.width;
            _x = _object.frame.origin.x;
        }
        _hight = hight;
        _y = _object.frame.origin.y + _object.frame.size.height - _hight;
    }
    else if ([object isKindOfClass:[UITextField class]]) {
        UITextField * _object = object;
        
        if (isMainScreenWidth == 1) {
            _lineWidth = SCREEN_WIDTH;
            _x = 0;
        }
        else {
            _lineWidth = _object.frame.size.width;
            _x = _object.frame.origin.x;
        }
        _hight = hight;
        _y = _object.frame.origin.y + _object.frame.size.height - _hight;
    }
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(_x, _y, _lineWidth, _hight)];
    [button setBackgroundColor:color];
    //    [(UIControl *) object addSubview:button];
    [((UIControl *) object).superview addSubview:button];
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
