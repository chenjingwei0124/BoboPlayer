//
//  PlayerViewController.m
//  BoboPlayer
//
//  Created by lanou on 15/10/31.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "PlayerViewController.h"
#import "MainViewController.h"
#import "MainPopListView.h"
#import "MainPopHidView.h"
#import "MainFootView.h"
#import "PlayerView.h"
#import "SongDataTools.h"
#import "PlayerTools.h"
#import "SongData.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"
#import "UIImage+BlurGlass.h"
#import "UIImage+WebP.h"
#import "SongDataBase.h"

@interface PlayerViewController ()<PlayerToolsDelegate>
@property (nonatomic, strong)MainViewController *mainVC;
@property (nonatomic, strong)MainFootView *footV;
@property (nonatomic, strong)MainPopHidView *popHidV;
@property (nonatomic, strong)MainPopListView *popListV;
@property (nonatomic, strong)PlayerView *playerView;

@property (nonatomic, strong)SongDataTools *songTools;
@property (nonatomic, strong)NSMutableArray *array;

@property (nonatomic, strong)PlayerTools *playerTools;
@property (nonatomic, strong)SongData *songData;
@property (nonatomic, assign)NSInteger indexPlayer;
@property (nonatomic, assign)NSInteger seaconPlayer;

@property (nonatomic, assign)BOOL isPlayer;
@property (nonatomic, strong)NSMutableArray *picArr;
@property (nonatomic, assign)NSInteger count;

@property (nonatomic, strong)NSMutableArray *songArr;

@property (nonatomic, assign)BOOL isFast;
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //indexPlayer
    self.indexPlayer = [[[NSUserDefaults standardUserDefaults] objectForKey:@"NowSong"] integerValue];
    //SongData
    self.songTools = [[SongDataTools alloc] init];
    [self songDataToArray];
    self.isPlayer = NO;
    
    self.navigationController.navigationBar.hidden = YES;
    __weak typeof(self)blockSelf = self;
    
    self.mainVC = [[MainViewController alloc] init];
    UINavigationController *mainNC = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
    [self addChildViewController:mainNC];
    [self.view addSubview:mainNC.view];
    
    //footV
    self.footV = [[MainFootView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height - 64, self.view.bounds.size.width, 64))];
    self.footV.backgroundColor = [UIColor whiteColor];
    [self.footV.footlistB addTarget:self action:@selector(footlistBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.footV.footplayerB addTarget:self action:@selector(footplayerBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.footV.footnextB addTarget:self action:@selector(upOneBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    self.footV.alpha = 0.9;
    
    //block
    self.footV.footBlock = ^(void){
        [UIView animateWithDuration:0.3 animations:^{
            blockSelf.playerView.frame = CGRectMake(0, 0, blockSelf.view.bounds.size.width, blockSelf.view.bounds.size.height);
        }];
    };
    [self.view addSubview:self.footV];
    
    //playerView
    self.playerView = [[PlayerView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height))];
    [self.playerView.backB addTarget:self action:@selector(backBDissAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerView.playListB addTarget:self action:@selector(playListBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerView.playB addTarget:self action:@selector(footplayerBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerView.sliderV addTarget:self action:@selector(sliderVChange:) forControlEvents:(UIControlEventValueChanged)];
    [self.playerView.orderB addTarget:self action:@selector(orderBPlayStyelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerView.nextOneB addTarget:self action:@selector(nextOneBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerView.upOneB addTarget:self action:@selector(upOneBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerView.collectB addTarget:self action:@selector(collectBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    //playerStyel
    NSString *playStyel = [[NSUserDefaults standardUserDefaults] objectForKey:@"SongStyel"];
    if ([playStyel isEqualToString:@"cycleplay"]) {
        self.playerView.orderB.titleLabel.text = @"cycleplay";
        [self.playerView.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-shunxuxunhuan"] forState:(UIControlStateNormal)];
    }
    if ([playStyel isEqualToString:@"singleplay"]) {
        self.playerView.orderB.titleLabel.text = @"singleplay";
        [self.playerView.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-danquxunhuan"] forState:(UIControlStateNormal)];
    }
    if ([playStyel isEqualToString:@"randomplay"]) {
        self.playerView.orderB.titleLabel.text = @"randomplay";
        [self.playerView.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-suijibofang"] forState:(UIControlStateNormal)];
    }
    [self.view addSubview:self.playerView];

    
    //popHidV
    self.popHidV = [[MainPopHidView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.footV.bounds.size.height))];
    self.popHidV.backgroundColor = [UIColor blackColor];
    self.popHidV.alpha = 0.3;
    
    //block
    self.popHidV.popHidBlock = ^(void){
        [blockSelf footlistBAction:blockSelf.footV.footlistB];
    };
    [self.view addSubview:self.popHidV];
    self.popHidV.hidden = YES;
    
    //popListV
    self.popListV = [[MainPopListView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height/2))];
    [self.popListV.lowB addTarget:self action:@selector(popListLowBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    self.popListV.array = self.array;
    [self.view addSubview:self.popListV];
    
    //block
    self.popListV.popListBlock = ^(NSInteger index){
        if (blockSelf.indexPlayer == index) {
            return ;
        }
        blockSelf.indexPlayer = index;
        [blockSelf musicPause];
        blockSelf.isPlayer = YES;
        [blockSelf musicWillBegin];
        [blockSelf footlistBAction:blockSelf.footV.footlistB];
    };
    
    //notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addSongDataNot:) name:@"addSongData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playSongDataNot:) name:@"playSongData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playChange:) name:@"play" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteSongDataNot:) name:@"deleteSongData" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playGeDanDataNot:) name:@"playGeDan" object:nil];
    
    [self musicChuShi];
    if (self.isFast) {
        [self musicWillBegin];
        self.isFast = YES;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(turnoffMusicPlayer:) name:@"musicPlayerShow" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopMusicPlayer) name:@"stopMusicPlayer" object:nil];
    
    
}

- (void)stopMusicPlayer{
    
    [self musicPause];
}

- (void)collectBAction:(UIButton *)button{
    SongData *songData = self.songData;
    SongDataBase *tempSongData = [[SongDataBase alloc] init];
    
    NSLog(@"%@", songData.songName);
    
    tempSongData.songName = songData.songName;
    tempSongData.songID = songData.songId;
    tempSongData.songAddress = songData.songAddress;
    tempSongData.singerID = songData.singerId;
    tempSongData.singerName = songData.singerName;
    tempSongData.albumID = songData.albumId;
    tempSongData.albumName = songData.albumName;
    tempSongData.numList = songData.numList;
    
    tempSongData.isCollect = @"1";
    [self.songTools addSongData:tempSongData];
    [self.songTools deleteSong:songData];
    [self songDataToArray];
    self.popListV.array = self.array;
    
}

-(void)turnoffMusicPlayer:(NSNotification *)object{
    
    if ([object.object isEqual:@"NO"]) {
        self.footV.hidden = YES;
    }
    if ([object.object isEqual:@"YES"]) {
        self.footV.hidden = NO;
    }
    
    
}

//
- (void)playGeDanDataNot:(NSNotification *)object{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/song/%@", object.object] completion:^(NSData *data) {
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSDictionary *dic2 = [dic1 objectForKey:@"data"];
            SongDataBase *song = [[SongDataBase alloc] init];
            [song setValuesForKeysWithDictionary:dic2];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                song.numList = @"0";
                song.isCollect = @"0";
                song.songAddress = nil;
                BOOL isData = YES;
                for (SongData *tempSongData in self.array) {
                    if (tempSongData.songId == song.songID) {
                        isData = NO;
                        NSLog(@"已经添加过");
                    }
                }
                if (isData == YES) {
                    [self.songTools addSongData:song];
                }
                [self songDataToArray];
                self.popListV.array = self.array;
                
                for (int i = 0; i < self.array.count; i++) {
                    SongData *songData = self.array[i];
                    if (songData.songId == song.songID) {
                        self.indexPlayer = i;
                    }
                }
                [self musicPause];
                self.isPlayer = YES;
                [self musicWillBegin];
            });
        });
        
    }];

}

//
- (void)deleteSongDataNot:(NSNotification *)object{
    SongData *songData = object.object;
    NSLog(@"%@ %@", songData.songId, songData.songAddress);
    [self.songTools deleteSong:songData];
    [self songDataToArray];
    [self musicWillBegin];
    
    self.popListV.array = self.array;
    
}

//play
- (void)playChange:(NSNotification *)object{
    NSArray *arr = object.object;
    NSLog(@"%@", arr);
    [self musicPause];
    if ([arr[0] integerValue] == 0) {
        self.indexPlayer = [arr[1] integerValue];
        self.isPlayer = YES;
        [self musicWillBegin];
    }
}

//播放通知
- (void)playSongDataNot:(NSNotification *)object{
    
    [self musicPause];
    SongDataBase *songDataBase = object.object;
    songDataBase.numList = @"0";
    songDataBase.isCollect = @"0";
    songDataBase.songAddress = nil;
    BOOL isData = YES;
    for (SongData *tempSongData in self.array) {
        if (tempSongData.songId == songDataBase.songID) {
            isData = NO;
            NSLog(@"已经添加过");
        }
    }
    if (isData == YES) {
        [self.songTools addSongData:songDataBase];
    }
    [self songDataToArray];
    self.popListV.array = self.array;
    
    for (int i = 0; i < self.array.count; i++) {
        SongData *songData = self.array[i];
        if (songData.songId == songDataBase.songID) {
            self.indexPlayer = i;
        }
    }
    [self musicPause];
    self.isPlayer = YES;
    [self musicWillBegin];
}

//滑动事件
- (void)sliderVChange:(UISlider *)slider{
    [self.playerTools musicSeekToTimeWithValue:slider.value];
}

- (void)musicChuShi{
    //PlayerTools
    self.playerTools = [PlayerTools sharePlayerTools];
    self.playerTools.playerToolsDelegate = self;
}

- (void)musicWillBegin{
   
    if (!self.array.count == 0) {
        self.songData = self.array[self.indexPlayer];
    }
    self.playerView.songData = self.songData;
    [self songLHandle];
}

//播放准备
- (void)musicPrePlay{
    
    if (self.songData.songAddress == nil) {
        [self.songTools deleteSong:self.songData];
        [self songDataToArray];
        [self musicPause];
        [self musicWillBegin];
        
        self.popListV.array = self.array;

        [self nextOneBAction:self.playerView.nextOneB];
    }
    
    [self singerVHandle];
    
    
    if ([self.playerTools.songData.songId isEqual:self.songData.songId]) {
        return;
    }
    [self.playerTools musicStop];
    self.playerTools.songData = self.songData;
    [self.playerTools musicPrePlay];
    
    self.footV.footnameL.text = self.songData.songName;
    self.footV.footauthorL.text = self.songData.singerName;
    
    self.playerView.titleL.text = self.songData.songName;
    self.playerView.singerL.text = self.songData.singerName;
    
}

//播放
- (void)musicPlay{
    [self.playerTools musicPlay];
    self.isPlayer = YES;
    [self.footV.footplayerB setBackgroundImage:[UIImage imageNamed:@"iconfont-zanting"] forState:(UIControlStateNormal)];
    [self.playerView.playB setBackgroundImage:[UIImage imageNamed:@"iconfont-zanting"] forState:(UIControlStateNormal)];
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%ld", self.indexPlayer] forKey:@"NowSong"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)musicPause{
    [self.playerTools musicPause];
}

//通知事件
- (void)addSongDataNot:(NSNotification *)object{
    [self.songTools addSongData:object.object];
    [self songDataToArray];
    self.popListV.array = self.array;
}

//SongTools
- (void)songDataToArray{
    self.array = [NSMutableArray arrayWithArray:[self.songTools selectTotalSongArray]];
}

- (void)playListBAction:(UIButton *)button{
    [self popListLowBAction:button];
}

- (void)backBDissAction:(UIButton *)button{
    [UIView animateWithDuration:0.3 animations:^{
        self.playerView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
}

- (void)popListLowBAction:(UIButton *)button{
    [self footlistBAction:self.footV.footlistB];
}

- (void)footlistBAction:(UIButton *)button{
    if (self.popListV.frame.origin.y == self.view.bounds.size.height) {
        [UIView animateWithDuration:0.3 animations:^{
            self.popListV.frame = CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/2);
        }];
        self.popHidV.hidden = NO;
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.popListV.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height/2);
        }];
        self.popHidV.hidden = YES;
    }
}

- (void)footplayerBAction:(UIButton *)button{
    if (self.isPlayer == YES) {
        [self.footV.footplayerB setBackgroundImage:[UIImage imageNamed:@"iconfont-play-o"] forState:(UIControlStateNormal)];
        [self.playerView.playB setBackgroundImage:[UIImage imageNamed:@"iconfont-play-o"] forState:(UIControlStateNormal)];
        [self musicPause];
        self.isPlayer = NO;
    }else{
        [self.footV.footplayerB setBackgroundImage:[UIImage imageNamed:@"iconfont-zanting"] forState:(UIControlStateNormal)];
        [self.playerView.playB setBackgroundImage:[UIImage imageNamed:@"iconfont-zanting"] forState:(UIControlStateNormal)];
        [self musicPlay];
        self.isPlayer = YES;
    }
}

//播放代理
- (void)getBacknowTime:(NSString *)nowTime totalTime:(NSString *)totalTime Progress:(float)progress Duration:(float)duration{
//    NSLog(@"1");
    [self rotationAnimation];
    
    self.footV.progressV.progress = progress / duration;
    
    self.playerView.timeingL.text = nowTime;
    self.playerView.totalTimeL.text = totalTime;
    self.playerView.sliderV.maximumValue = duration;
    self.playerView.sliderV.value = progress;
    
    self.count = self.count + 1;
    if (self.count == 300) {
        [self replaceSingerPic];
        self.count = 0;
    }
}

//换图片
- (void)replaceSingerPic{
    if (self.picArr.count != 0) {
        NSString *index = self.picArr[random()%self.picArr.count];
        [self.playerView.singerV sd_setImageWithURL:[NSURL URLWithString:index] placeholderImage:[UIImage imageNamed:@"beijing.jpg"]];
        [self.footV.footImageV sd_setImageWithURL:[NSURL URLWithString:index] placeholderImage:[UIImage imageNamed:@"beijing.jpg"]];
        
        UIImage *image = self.playerView.singerV.image;
        self.playerView.backImageV.image = [image imgWithLightAlpha:0.1 radius:16 colorSaturationFactor:0.9];
    }else{
        self.playerView.singerV.image = [UIImage imageNamed:@"changpian"];
        self.footV.footImageV.image = [UIImage imageNamed:@"changpian"];
        UIImage *img = [UIImage imageNamed:@"beijing.jpg"];
        self.playerView.backImageV.image = [img imgWithLightAlpha:0.1 radius:16 colorSaturationFactor:0.9];
    }
}


//播放顺序
- (void)orderBPlayStyelAction:(UIButton *)button{
    NSLog(@"%@", self.playerView.orderB.titleLabel.text);
    if ([button.titleLabel.text isEqualToString:@"cycleplay"]) {
        [self.playerView.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-danquxunhuan"] forState:(UIControlStateNormal)];
        self.playerView.orderB.titleLabel.text = @"singleplay";
    }else if ([button.titleLabel.text isEqualToString:@"singleplay"]) {
        [self.playerView.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-suijibofang"] forState:(UIControlStateNormal)];
        self.playerView.orderB.titleLabel.text = @"randomplay";
        return;
    }else if ([button.titleLabel.text isEqualToString:@"randomplay"]) {
        [self.playerView.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-shunxuxunhuan"] forState:(UIControlStateNormal)];
        self.playerView.orderB.titleLabel.text = @"cycleplay";
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@", self.playerView.orderB.titleLabel.text] forKey:@"SongStyel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//上一曲
- (void)nextOneBAction:(UIButton *)button{
    if (self.indexPlayer == self.array.count - 1) {
        self.indexPlayer = 0;
    }else {
        self.indexPlayer ++;
    }
    [self musicPause];
//    self.isPlayer = NO;
    [self musicWillBegin];
}

//下一曲
- (void)upOneBAction:(UIButton *)button{
    if (self.indexPlayer > 0) {
        self.indexPlayer --;
    }else{
        self.indexPlayer = self.array.count - 1;
    }
    [self musicPause];
    [self musicPrePlay];
//    self.isPlayer = NO;
    [self musicWillBegin];

}

//音乐结束
- (void)endMusicPlayer{
    [self musicPause];
    
    
    if ([self.playerView.orderB.titleLabel.text isEqualToString:@"cycleplay"]) {
        self.playerTools.songData = nil;
        [self nextOneBAction:self.playerView.nextOneB];
    }
    if ([self.playerView.orderB.titleLabel.text isEqualToString:@"singleplay"]) {
        self.playerTools.songData = nil;
        self.indexPlayer = self.indexPlayer + 1;
        [self upOneBAction:self.playerView.upOneB];
    }
    if ([self.playerView.orderB.titleLabel.text isEqualToString:@"randomplay"]) {
        self.playerTools.songData = nil;
        self.indexPlayer = arc4random() % self.array.count;
        [self nextOneBAction:self.playerView.nextOneB];
    }

}

//图片旋转
//static int k = 1;
- (void)rotationAnimation{
//    [UIView animateWithDuration:0.01 animations:^{
//        self.footV.footImageV.transform = CGAffineTransformMakeRotation(k * M_PI / 1800);
//        self.playerView.singerV.transform = CGAffineTransformMakeRotation(k * M_PI / 3600);
//    } completion:^(BOOL finished) {
//        k += 10;
//        if (self.isPlayer == YES) {
//            [self rotationAnimation];
//        }
//    }];
    
    self.footV.footImageV.transform = CGAffineTransformRotate(self.footV.footImageV.transform, M_PI/180);
    self.playerView.singerV.transform = CGAffineTransformRotate(self.playerView.singerV.transform, M_PI/360);
}

//图片解析
- (void)singerVHandle{
    self.picArr = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://so.ard.iyyin.com/s/pic?singerid=%@", self.songData.singerId] completion:^(NSData *data) {
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *arr1 = [dic1 objectForKey:@"data"];
            for (NSDictionary *dic2 in arr1) {
                NSArray *arr2 = [dic2 objectForKey:@"picUrls"];
                for (NSDictionary *dic3 in arr2) {
                    NSString *picUrl = [dic3 objectForKey:@"picUrl"];
                    [self.picArr addObject:picUrl];
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"%@", self.picArr);
                [self replaceSingerPic];
            });
        });

    }];
}

//歌曲解析
- (void)songLHandle{
    self.songArr = [NSMutableArray array];
    
//    NSLog(@"%@", self.songData.songId);
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/song/%@", self.songData.songId] completion:^(NSData *data) {
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSDictionary *dic2 = [dic1 objectForKey:@"data"];
            NSArray *arr1 = [dic2 objectForKey:@"auditionList"];
            for (NSDictionary *dic3 in arr1) {
                NSString *songStr = [dic3 objectForKey:@"url"];
                [self.songArr addObject:songStr];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"%@", self.songArr);
                if (self.songArr == nil) {
                    [self nextOneBAction:self.playerView.nextOneB];
                }
                if (!self.songArr.count == 0) {
                    self.songData.songAddress = self.songArr[1];
                }
                [self musicPause];
                [self musicPrePlay];
                if (self.isPlayer == YES) {
                [self musicPlay];
                }
            });
        });
        
    }];
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
