//
//  huobanLoginViewController.m
//  huoban登录注册部分
//
//  Created by 马锦航 on 15/12/17.
//  Copyright © 2015年 马锦航. All rights reserved.
//

#import "huobanLoginViewController.h"
#import "CDPMonitorKeyboard.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface huobanLoginViewController ()<UITextFieldDelegate>



 @property (nonatomic,strong) UITextField * huobanPhoneNum;          //手机号
 
 @property (nonatomic,strong) UITextField * huobanPassWorld;         //密码

 @property (nonatomic,strong) UIButton * passWorldCancel;            //密码取消按钮

 @property (nonatomic,strong) UIView * loginView;                    //登录视图
 
 @property (nonatomic,strong) UIButton * loginButton;                //登录按钮
 
 @property (nonatomic,strong) UIView * huobanFootView;               //底部视图
 
 @property (nonatomic,strong) UIButton * huobanFoundPassWorld;       //找回密码
 
 @property (nonatomic,strong) UIButton * huobanRegister;             //注册密码

@end

@implementation huobanLoginViewController

#pragma mark - 懒加载

- (UITextField *)huobanPhoneNum {
    if (!_huobanPhoneNum) {
        _huobanPhoneNum = [[UITextField alloc]initWithFrame:CGRectMake(12, 0, SCREEN_WIDTH - 12*2, 60)];
        [_huobanPhoneNum setPlaceholder:@"手机号"];
        [_huobanPhoneNum setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        _huobanPhoneNum.delegate = self;
        NSLog(@"%@",NSStringFromCGRect(_huobanPhoneNum.frame));
//        [_huobanPhoneNum setBackgroundColor:[UIColor grayColor]];
    }
    return _huobanPhoneNum;
}

- (UIButton *) passWorldCancel {
    if (!_passWorldCancel) {
//        _passWorldCancel = [[UIButton alloc] initWithFrame:CGRectMake(self.huobanPassWorld.frame.size.width - 32, 20, 32, 32)];
        NSInteger cancelButtonWidth = 25;
        _passWorldCancel = [[UIButton alloc] initWithFrame:CGRectMake(self.huobanPassWorld.frame.origin.x + self.huobanPassWorld.frame.size.width - cancelButtonWidth, self.huobanPassWorld.frame.origin.y + self.huobanPassWorld.frame.size.height - cancelButtonWidth - 10, cancelButtonWidth, cancelButtonWidth)];
        [_passWorldCancel setBackgroundImage:[UIImage imageNamed:@"登录_x@2x"] forState:UIControlStateNormal];
        _passWorldCancel.hidden = YES;
//        [_passWorldCancel setBackgroundColor:[UIColor blackColor]];
    }
    return _passWorldCancel;
}

- (UITextField *)huobanPassWorld {
    if (!_huobanPassWorld) {
        _huobanPassWorld = [[UITextField alloc]initWithFrame:CGRectMake(12,self.huobanPhoneNum.frame.origin.y+self.huobanPhoneNum.frame.size.height, SCREEN_WIDTH - 12*2, 60)];
        NSLog(@"%@",NSStringFromCGRect(_huobanPassWorld.frame));
        [_huobanPassWorld setPlaceholder:@"密码"];
        [_huobanPassWorld setFont:[UIFont fontWithName:@"PingFangSC-Light" size:14.7]];
        _huobanPassWorld.delegate = self;
//        [_huobanPassWorld addSubview:_passWorldCancel];
    }
    return _huobanPassWorld;
}


#pragma mark 中部登录视图

//320*568   navi 64 + 60 *3 + 36 +12 +
- (UIButton *)loginButton {
    if (!_loginButton) {
        NSInteger loginButtonHigth = 50;
        _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - loginButtonHigth/2 , 20, loginButtonHigth, loginButtonHigth)];
        [_loginButton setBackgroundColor:[UIColor redColor]];
        _loginButton.layer.cornerRadius = loginButtonHigth/2;
        
    }
    return _loginButton;
}

- (UIView *)loginView {
    if (!_loginView) {
        _loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT - 120 - 50 - 64)];
        [_loginView setBackgroundColor:[UIColor yellowColor]];
        NSLog(@"mainScreen.bounds:%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
        //添加一个不透明的跟当前视图大小一样的按钮，作为取消键盘的点击按钮
        UIButton * resignKeyboardResbonder = [[UIButton alloc]initWithFrame:_loginView.bounds];
//        [resignKeyboardResbonder setBackgroundColor:[UIColor blackColor]];
        [resignKeyboardResbonder addTarget:self action:@selector(resignTextFieldFirstResponder) forControlEvents:UIControlEventTouchUpInside];
        [_loginView addSubview:resignKeyboardResbonder];
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
    
    
    [self.view addSubview:self.passWorldCancel];
    [self addUnderLineWithObject:self.huobanPhoneNum color:[UIColor redColor] hight:2 isMainScreenWidth:0 isTopOrBottom:0];
    [self addUnderLineWithObject:self.huobanPassWorld color:[UIColor redColor] hight:2 isMainScreenWidth:0 isTopOrBottom:0];
//    [self addUnderLineWithObject:self.loginView color:[UIColor redColor] hight:2 isMainScreenWidth:1];
    [self addUnderLineWithObject:self.huobanFootView color:[UIColor redColor] hight:2 isMainScreenWidth:3 isTopOrBottom:1];

    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

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
    if (textField == self.huobanPassWorld) {
        self.passWorldCancel.hidden = NO;
    }
    CGRect _footViewNewFrame = self.huobanFootView.frame;
    _footViewNewFrame.origin.y -= 253;
    self.huobanFootView.frame = _footViewNewFrame;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField == self.huobanPassWorld) {
        self.passWorldCancel.hidden = YES;
        
    }
    CGRect _footViewNewFrame = self.huobanFootView.frame;
    _footViewNewFrame.origin.y += 253;
    self.huobanFootView.frame = _footViewNewFrame;

    return YES;
}
#pragma mark 取消键盘
- (void) resignTextFieldFirstResponder {
    
    NSLog(@"resignTextFieldFirstResponder");
    [self.huobanPassWorld resignFirstResponder];
    [self.huobanPhoneNum resignFirstResponder];

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
- (void) addUnderLineWithObject:(id)object color:(UIColor *)color hight:(CGFloat)hight isMainScreenWidth:(NSInteger)isMainScreenWidth isTopOrBottom:(NSInteger)isTop {
    NSInteger _lineWidth;
    NSInteger _hight;
    NSInteger _x = 0;
    NSInteger _y;
    NSInteger _isTop;
    
    _isTop = isTop;
    if ([object isKindOfClass:[UIView class]]) {
        UIView * _object = object;
        if (isMainScreenWidth == 1) {
            _lineWidth = SCREEN_WIDTH;
        }
        else {
            _lineWidth = _object.frame.size.width;
        }
        _hight = hight;
        if (isTop) {
            _y = 0;
        }
        else {
            _y = _object.frame.size.height - _hight;
        }
    }
    else if ([object isKindOfClass:[UITextField class]]) {
        UITextField * _object = object;
        
        if (isMainScreenWidth == 1) {
            _lineWidth = SCREEN_WIDTH;
        }
        else {
            _lineWidth = _object.frame.size.width;
        }
        _hight = hight;
        if (isTop) {
            _y = 0;
        }
        else {
            _y = _object.frame.size.height - _hight;
        }
    }
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(_x, _y, _lineWidth, _hight)];
    [button setBackgroundColor:color];
    UIButton * buttonTest = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 2)];
    [buttonTest setBackgroundColor:color];
//    [(UIControl *) object addSubview:button];

    [((UIControl *) object) addSubview:button];
    
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
