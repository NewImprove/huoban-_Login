//
//  RegisterViewController.m
//  huoban登录注册部分
//
//  Created by 马锦航 on 15/12/17.
//  Copyright © 2015年 马锦航. All rights reserved.
//

#import "huobanRegisterViewController.h"
#import "CDPMonitorKeyboard.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define FormItemHeight 55

@interface  huobanRegisterViewController()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField * huobanPhoneNum;          //手机号

@property (nonatomic,strong) UITextField * huobanSecurity;          //验证码

@property (nonatomic,strong) UITextField * huobanPassWorld;         //密码

@property (nonatomic,strong) UITextField * huobanPassWorldCheck;    //检查密码

@property (nonatomic,strong) UIView * loginView;                    //登录视图

@property (nonatomic,strong) UIButton * loginButton;                //登录按钮

@property (nonatomic,strong) UIView * huobanFootView;               //底部视图

@property (nonatomic,strong) UIButton * huobanFoundPassWorld;       //找回密码

@property (nonatomic,strong) UIButton * huobanRegister;             //注册密码



@end

@implementation huobanRegisterViewController

#pragma mark - 懒加载

- (UITextField *)huobanPhoneNum {
    if (!_huobanPhoneNum) {
        _huobanPhoneNum = [[UITextField alloc]initWithFrame:CGRectMake(12, 0, SCREEN_WIDTH - 12*2, FormItemHeight)];
        [_huobanPhoneNum setPlaceholder:@"手机号"];
        [_huobanPhoneNum setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        NSLog(@"%@",NSStringFromCGRect(_huobanPhoneNum.frame));
        _huobanPhoneNum.delegate = self;
        //        [_huobanPhoneNum setBackgroundColor:[UIColor grayColor]];
        
    }
    

    return _huobanPhoneNum;
}



- (UITextField *)huobanSecurity {
    if (!_huobanSecurity) {
        _huobanSecurity = [[UITextField alloc]initWithFrame:CGRectMake(12,self.huobanPhoneNum.frame.origin.y+self.huobanPhoneNum.frame.size.height, SCREEN_WIDTH - 12*2, FormItemHeight)];
        NSLog(@"%@",NSStringFromCGRect(_huobanPassWorld.frame));
        [_huobanSecurity setPlaceholder:@"验证码"];
        [_huobanSecurity setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        _huobanSecurity.delegate = self;
        
    }
    return _huobanSecurity;
}



- (UITextField *)huobanPassWorld {
    if (!_huobanPassWorld) {
        _huobanPassWorld = [[UITextField alloc]initWithFrame:CGRectMake(12,self.huobanSecurity.frame.origin.y+self.huobanSecurity.frame.size.height, SCREEN_WIDTH - 12*2, FormItemHeight)];
        [_huobanPassWorld setPlaceholder:@"6-16位密码"];
        [_huobanPassWorld setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        _huobanPassWorld.delegate = self;
    }
    return _huobanPassWorld;
}

- (UITextField *)huobanPassWorldCheck {
    if (!_huobanPassWorldCheck) {
        _huobanPassWorldCheck = [[UITextField alloc]initWithFrame:CGRectMake(12,self.huobanPassWorld.frame.origin.y+self.huobanPassWorld.frame.size.height, SCREEN_WIDTH - 12*2, FormItemHeight)];
        [_huobanPassWorldCheck setPlaceholder:@"确认密码"];
        [_huobanPassWorldCheck setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        _huobanPassWorldCheck.delegate = self;
    }
    return _huobanPassWorldCheck;

}


#pragma mark 中部登录视图

//320*568   navi 64 + 60 *3 + 36 +12 +
//- (UIButton *)loginButton {
//    if (!_loginButton) {
//        NSInteger loginButtonHigth = 50;
//        _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - loginButtonHigth/2 , 36, loginButtonHigth, loginButtonHigth)];
//        [_loginButton setBackgroundColor:[UIColor redColor]];
//        _loginButton.layer.cornerRadius = loginButtonHigth/2;
//    }
//    return _loginButton;
//}

//- (UIView *)loginView {
//    if (!_loginView) {
//        _loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT - 120 - 50 - 64)];
//        [_loginView setBackgroundColor:[UIColor greenColor]];
//        NSLog(@"mainScreen.bounds:%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
//        [_loginView addSubview:self.loginButton];
//    }
//    return _loginView;
//}


#pragma mark 底部视图
- (UIView *)huobanFootView {
    if (!_huobanFootView) {
        _huobanFootView = [[UIView alloc]initWithFrame:CGRectMake(0,self.huobanPassWorldCheck.frame.origin.y + self.huobanPassWorldCheck.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _huobanFootView.frame.origin.y)];
        UIButton * resignKeyboardResbonder = [[UIButton alloc]initWithFrame:_huobanFootView.bounds];
//                [resignKeyboardResbonder setBackgroundColor:[UIColor blackColor]];
        [resignKeyboardResbonder addTarget:self action:@selector(resignTextFieldFirstResponder) forControlEvents:UIControlEventTouchUpInside];
        [_huobanFootView addSubview:resignKeyboardResbonder];
        [_huobanFootView setBackgroundColor:[UIColor greenColor]];
//        [_huobanFootView addSubview:self.huobanFoundPassWorld];
//        [_huobanFootView addSubview:self.huobanRegister];
    }
    return _huobanFootView;
}
#if 0



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
#endif



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    //添加电话号码文本框到当前视图
    [self.view addSubview:self.huobanPhoneNum];
    
    //添加验证码文本框
    [self.view addSubview:self.huobanSecurity];
#if 1

    //添加密码文本框到当前视图
    [self.view addSubview:self.huobanPassWorld];
    [self.view addSubview:self.huobanPassWorldCheck];
    //添加底部登录视图到当前视图
    [self.view addSubview:self.huobanFootView];
    
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    
#endif
    [self addUnderLineWithObject:self.huobanPhoneNum color:[UIColor redColor] hight:2 isMainScreenWidth:0];
    [self addUnderLineWithObject:self.huobanPassWorld color:[UIColor redColor] hight:2 isMainScreenWidth:0];
    [self addUnderLineWithObject:self.huobanSecurity color:[UIColor redColor] hight:2 isMainScreenWidth:0];
    [self addUnderLineWithObject:self.huobanPassWorldCheck color:[UIColor redColor] hight:2 isMainScreenWidth:0];
    
    
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

#pragma mark 取消键盘
- (void) resignTextFieldFirstResponder {
    
    NSLog(@"resignTextFieldFirstResponder");
    [self.huobanPassWorld resignFirstResponder];
    [self.huobanPhoneNum resignFirstResponder];
    [self.huobanSecurity resignFirstResponder];
    [self.huobanPassWorldCheck resignFirstResponder];
    
}

#pragma mark 键盘监听方法设置
//当键盘出现时调用
-(void)keyboardWillShow:(NSNotification *)aNotification{
    //第一个参数写输入view的父view即可，第二个写监听获得的notification，第三个写希望高于键盘的高度(只在被键盘遮挡时才启用,如控件未被遮挡,则无变化)
    //如果想不通输入view获得不同高度，可自己在此方法里分别判断区别
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillShowWithSuperView:self.view andNotification:aNotification higherThanKeyboard:0];
    NSLog(@"keyboardWillShow");
    
}
//当键退出时调用
-(void)keyboardWillHide:(NSNotification *)aNotification{
    [[CDPMonitorKeyboard defaultMonitorKeyboard] keyboardWillHide];
    NSLog(@"keyboardWillHide");
}


#pragma mark UITextFieldDelegate

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField ");
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    return YES;
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
