//
//  WebView.m
//  MPlayer
//
//  Created by SUN on 15/10/27.
//  Copyright (c) 2015年 孙海睿. All rights reserved.
//

#import "WebView.h"

@interface WebView ()<UIWebViewDelegate>

@end

@implementation WebView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        [self addSubview:web];
        
        
        NSString *str = [NSString stringWithFormat:@"http://music.baidu.com/cms/webview/mobile-temp-special/v10/index.html"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
        web.delegate =self;
        [web loadRequest:request];
        
        
        [web reload];
        

        
        
    }
    return self;
}
//webView开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"start");
}


//webView结束加载
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
//    [[NSUserDefaults standardUserDefaults] setObject:self.server forKey:@"server"];
//    [[NSUserDefaults standardUserDefaults] setObject:self.name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
}

//加载发生错误
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", error);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
