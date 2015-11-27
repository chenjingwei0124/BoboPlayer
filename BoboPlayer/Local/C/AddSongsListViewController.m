//
//  AddSongsListViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "AddSongsListViewController.h"
#import "UIColor+AddColor.h"
@interface AddSongsListViewController ()<UITextFieldDelegate>
@property(nonatomic,retain) UITextField *songListName;
@end

@implementation AddSongsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headV = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, 64))];
    self.headV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
    [self.view addSubview:self.headV];
    
    self.backB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.backB.frame = CGRectMake(self.view.bounds.size.width/30, self.headV.bounds.size.height/2, 50, 30);
    [self.backB setTitle:@"取消" forState:(UIControlStateNormal)];
    [self.backB addTarget:self action:@selector(backBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.backB];
    
    self.searchB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.searchB.frame = CGRectMake(self.view.bounds.size.width - self.view.bounds.size.width/30 - 50, self.headV.bounds.size.height/2, 50, 30);
    [self.searchB setTitle:@"完成" forState:(UIControlStateNormal)];
    [self.searchB addTarget:self action:@selector(searchBAction:) forControlEvents:(UIControlEventTouchUpInside)];

    [self.view addSubview:self.searchB];
    
    
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 50, self.headV.frame.size.height / 2 - 30 / 2 + 10, 100, 40))];
    titlelabel.text = @"添加歌单";
    titlelabel.font = [UIFont systemFontOfSize:20];
    titlelabel.textAlignment = YES;
    titlelabel.textColor = [UIColor whiteColor];
    
    [self.headV addSubview:titlelabel];
    
    
    self.songListName = [[UITextField alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 10, 65 + self.view.frame.size.height / 20 , self.view.frame.size.width / 10 * 8, 40))];
    self.songListName.borderStyle = UITextBorderStyleRoundedRect;
    self.songListName.backgroundColor = [UIColor huiseColor];

    [self.view addSubview:self.songListName];
    
    
    
    
    
}

- (void)backBAction:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    

    return YES;


}

- (void)searchBAction:(UIButton *)button{
    NSLog(@"添加歌单完成");
    
    
    if (_delegate != nil && [_delegate respondsToSelector:@selector(AddSongsListViewControllerBackFront:textFieldText:)] ) {

        //代理执行方法
        [_delegate AddSongsListViewControllerBackFront:self textFieldText:self.songListName.text];
        
    }

    [self dismissViewControllerAnimated:YES completion:nil];

    
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
