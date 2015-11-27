//
//  RegistViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
@property(nonatomic,retain)UITextField *userNameTF;
@property(nonatomic,retain)UITextField *PWDTF;
@property(nonatomic,retain)UITextField *surePWDTF;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headV = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, 64))];
    self.headV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
    [self.view addSubview:self.headV];
    
    self.leftB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.leftB.frame = CGRectMake(self.view.bounds.size.width/30, self.headV.bounds.size.height/2, 50, 30);
    [self.leftB setTitle:@"取消" forState:(UIControlStateNormal)];
    [self.leftB addTarget:self action:@selector(backBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.leftB];
    
    self.rightB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.rightB.frame = CGRectMake(self.view.bounds.size.width - self.view.bounds.size.width/30 - 50, self.headV.bounds.size.height/2, 50, 30);
    [self.rightB setTitle:@"完成" forState:(UIControlStateNormal)];
    [self.rightB addTarget:self action:@selector(doneAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:self.rightB];
    
    
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 50, self.headV.frame.size.height / 2 - 30 / 2 + 10, 100, 40))];
    titlelabel.text = @"注册账号";
    titlelabel.font = [UIFont systemFontOfSize:20];
    titlelabel.textAlignment = YES;
    titlelabel.textColor = [UIColor whiteColor];
    
    [self.headV addSubview:titlelabel];
    
    
    UILabel *userNameLabel =[[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 10, 65 + self.view.frame.size.height / 20 , self.view.frame.size.width / 5, 30))];
    userNameLabel.text = @"用户名:";
    
    
    self.userNameTF = [[UITextField alloc]initWithFrame:(CGRectMake(userNameLabel.frame.size.width + userNameLabel.frame.origin.x, userNameLabel.frame.origin.y, self.view.frame.size.width / 2, 30))];
    self.userNameTF.borderStyle = UITextBorderStyleRoundedRect ;
    
    UILabel *PWDLabel =[[UILabel alloc]initWithFrame:(CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y + userNameLabel.frame.size.height + 10, userNameLabel.frame.size.width, userNameLabel.frame.size.height))];
    PWDLabel.text = @"密    码:";
    
    self.PWDTF = [[UITextField alloc]initWithFrame:(CGRectMake(userNameLabel.frame.size.width + userNameLabel.frame.origin.x, PWDLabel.frame.origin.y, self.userNameTF.frame.size.width, self.userNameTF.frame.size.height))];
    self.PWDTF.borderStyle = UITextBorderStyleRoundedRect;
    self.PWDTF.secureTextEntry = YES;
    
    UILabel *suerPWDLabel =[[UILabel alloc]initWithFrame:(CGRectMake(userNameLabel.frame.origin.x, PWDLabel.frame.origin.y + PWDLabel.frame.size.height + 10, userNameLabel.frame.size.width, userNameLabel.frame.size.height))];
    suerPWDLabel.text = @"确认密码:";
    
    self.surePWDTF = [[UITextField alloc]initWithFrame:(CGRectMake(userNameLabel.frame.size.width + userNameLabel.frame.origin.x,suerPWDLabel.frame.origin.y, self.userNameTF.frame.size.width, self.userNameTF.frame.size.height))];
    self.surePWDTF.borderStyle = UITextBorderStyleRoundedRect;
    self.surePWDTF.secureTextEntry = YES;
    
    
   
    
    [self.view addSubview:suerPWDLabel];
    [self.view addSubview:self.surePWDTF];
    [self.view addSubview:userNameLabel];
    [self.view addSubview:self.userNameTF];
    [self.view addSubview:PWDLabel];
    [self.view addSubview:self.PWDTF];

    
    
}



- (void)backBAction:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    return YES;
    
    
}

- (void)doneAction:(UIButton *)button{
    
//    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"用户名不能为空" preferredStyle:(UIAlertControllerStyleActionSheet)];
//    [self.navigationController pushViewController:alertC animated:nil];
    if ([self.userNameTF.text isEqual: @""]) {

        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"用户名不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        
        
    }else if (![self.PWDTF.text isEqualToString:self.surePWDTF.text]){
    
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"两次密码不同,请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        self.PWDTF.text = @"";
        self.surePWDTF.text = @"";
        [alertView show];

    
    }else if ([self.PWDTF.text isEqual:@""] || [self.surePWDTF.text isEqual:@""]){
    
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"密码不能为空,请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
       
        [alertView show];
    
    }
    
    else{
        
        
        self.regist(self.userNameTF.text);
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
        
    }
    
    
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
