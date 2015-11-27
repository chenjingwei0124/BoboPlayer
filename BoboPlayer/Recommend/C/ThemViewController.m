//
//  ThemViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "ThemViewController.h"
#import "SVProgressHUD.h"
@interface ThemViewController ()<UIWebViewDelegate>

@end

@implementation ThemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 *2))];
    [self.view addSubview:webView];
    
    NSString *str = [NSString stringWithFormat:@"%@",self.webUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:20];
    webView.delegate = self;
    [webView loadRequest:request];
    [webView reload];
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSong:(ThemeSong *)song
{
    _song = song;
    self.webUrl = [song.action objectForKey:@"value"];
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
