//
//  LocalViewController.m
//  BoboPlayer
//
//  Created by lanou on 15/10/31.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "LocalViewController.h"
#import "SongDataTools.h"
#import "SongDataBase.h"


@interface LocalViewController ()

@property (nonatomic, strong)SongDataTools *songTools;
@end

@implementation LocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.frame = CGRectMake(100, 100, 50, 30);
    [button setTitle:@"heha" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(selectorAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    self.songTools = [[SongDataTools alloc] init];

}

- (void)selectorAction:(UIButton *)button{

//    SongDataBase *dataBase = [[SongDataBase alloc] init];
//    dataBase.songName = @"断点";
//    dataBase.singerName = @"张敬轩";
//    dataBase.albumName = @"张敬轩精选";
//    dataBase.songAddress = @"http://m5.file.xiami.com/175/1175/436269/1770153454_16005320_l.mp3?auth_key=d7e53db63095ab2cb8261584bcf41f33-1446508800-0-null";
//    dataBase.numList = @"0";
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"addSongData" object:dataBase];
     NSLog(@"haha");
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
