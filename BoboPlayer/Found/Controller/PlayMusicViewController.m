//
//  PlayMusicViewController.m
//  MyMusic
//
//  Created by sajyy on 15/11/4.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "PlayMusicViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MusicListController.h"
#import "UIColor+AddColor.h"
#import "UIView+Extension.h"
#import "BottomView.h"
#import "AlbumListModel.h"
#import "UIImageView+WebCache.h"
#import "MusicsTool.h"
#import "AVPlayerTool.h"
#import "ListFourModel.h"
#import "NetHandler.h"
#import "pictModel.h"


static AVPlayer *_avPlayer;

@interface PlayMusicViewController ()
//图片
@property (nonatomic,strong) UIImageView *backgroundView;

//小图
@property (nonatomic,strong) UIImageView *smallBackgroundView;

//底部工具栏
@property (nonatomic,strong) BottomView *bottomView;

//顶部展示
@property (nonatomic,strong) UIView *topView;

//时间展示
@property (nonatomic,strong) UIButton *timeButton;

//播放歌曲名字
@property (nonatomic,strong) UILabel *nameLabel;

//播放歌曲信息
@property (nonatomic,strong) UILabel *groupLabel;

//监听是播放还是暂停
@property (nonatomic,assign) BOOL isPlay;

//当前播放的歌曲
@property (nonatomic,strong) AlbumListModel *musicModel;

////播放器
//@property (nonatomic,strong) AVPlayer *player;

@property (nonatomic,strong) AVPlayerItem *avPlayerItem;

//时间指示器
@property (nonatomic,strong) NSTimer *progressTimer;

//给滑块添加拖拽手势
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;

@property (nonatomic,strong) pictModel *pictM;
@property (nonatomic,assign) BOOL isOK;

@end

@implementation PlayMusicViewController

-(instancetype)initWithPlayingMusic:(AlbumListModel *)isPlayingMusic listArray:(NSMutableArray *)array{
    self = [super init];
    if (self != nil) {
        _playingMusic = isPlayingMusic;
        _listArray = array;
        self.isOK = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height*5/6)];
    self.topView.backgroundColor = [UIColor shenhuiseColor];
    [self.view addSubview:self.topView];
    
    self.backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/6,self.view.bounds.size.width/3-64, self.view.bounds.size.width*2/3, self.view.bounds.size.width*2/3)];
    self.backgroundView.backgroundColor = [UIColor grayColor];
    self.backgroundView.layer.cornerRadius = self.view.bounds.size.width*1.8/5;
    self.backgroundView.layer.borderWidth = 5;
    self.backgroundView.layer.borderColor = [[UIColor colorWithRed:arc4random()%266/265.0 green:arc4random()%266/265.0 blue:arc4random()%266/265.0 alpha:0.8] CGColor];
    self.backgroundView.layer.masksToBounds = YES;
    self.backgroundView.layer.shadowOpacity = 5;
    self.backgroundView.layer.shadowRadius = 10;
    self.backgroundView.layer.shadowColor = [[UIColor yellowColor] CGColor];
    self.backgroundView.layer.shadowOffset = CGSizeMake(2, 2);
    [self.topView addSubview:self.backgroundView];
    self.smallBackgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(self.backgroundView.bounds.size.width/6, self.backgroundView.bounds.size.width/6, self.backgroundView.bounds.size.width*2/3, self.backgroundView.bounds.size.width*2/3)];
    self.smallBackgroundView.backgroundColor = [UIColor shenhuiseColor];
    [self.backgroundView  addSubview:self.smallBackgroundView];
    
    
    self.timeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.timeButton.frame = CGRectMake(0, self.topView.bounds.size.height - 25, 50, 20);
    self.timeButton.backgroundColor = [UIColor blackColor];
    self.timeButton.layer.cornerRadius = 5;
    [self.topView addSubview:self.timeButton];
    [self.timeButton setTitle:@"祝您快乐" forState:(UIControlStateNormal)];
    self.timeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:self.timeButton];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,self.timeButton.frame.origin.y - 70, 180, 30)];
//    self.nameLabel.backgroundColor = [UIColor blackColor];
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.nameLabel];
    
    self.groupLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80,self.nameLabel.frame.origin.y +self.nameLabel.bounds.size.height + 5, 80, 30)];
//    self.groupLabel.backgroundColor = [UIColor blackColor];
    self.groupLabel.textColor = [UIColor whiteColor];
    self.groupLabel.textAlignment = NSTextAlignmentCenter;
    self.groupLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.groupLabel];
    
    self.bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0,self.view.bounds.size.height*5/6,self.view.bounds.size.width , self.view.bounds.size.height/6)];
    self.bottomView.backgroundColor = [UIColor qianweise];
    
    [self.bottomView.previousMusic addTarget:self action:@selector(previousMusicAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bottomView.pauseMusic addTarget:self action:@selector(pauseMusicAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bottomView.nextMusic addTarget:self action:@selector(nextMusicAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    _avPlayer = [[AVPlayer alloc]init];
    [self.view addSubview:self.bottomView];
    NSInteger index = [self.listArray indexOfObject:_playingMusic];
    [self handle:index];
    if (self.isOK == NO) {
        [self resolve];
    }
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopds:) name:@"stopds" object:nil];
}

- (void)stopds:(NSNotification *)not{
    [_avPlayer pause];
}

-(void)previousMusicAction:(UIButton *)button{
    if (self.isPlay == YES) {
        [self.bottomView.pauseMusic setImage:[UIImage imageNamed:@"iconfont-stop-active"] forState:(UIControlStateNormal)];
        [_avPlayer pause];
        self.isPlay = NO;
    }
    NSInteger currentIndex = [self.listArray indexOfObject:self.musicModel];
    NSInteger previousIndex = 0;
    if (currentIndex == 0) {
        previousIndex = self.listArray.count - 1;
    }else{
        previousIndex = currentIndex - 1;
    }
    [self handle:previousIndex];
    [self blockAnimation];
}


-(void)pauseMusicAction:(UIButton *)button{
    if (self.isPlay == NO) {
        [self.bottomView.pauseMusic setImage:[UIImage imageNamed:@"iconfont-playcircleo"] forState:(UIControlStateNormal)];
        [_avPlayer pause];
        self.isPlay = YES;
    }else{
        [self.bottomView.pauseMusic setImage:[UIImage imageNamed:@"iconfont-stop-active"] forState:(UIControlStateNormal)];
        [_avPlayer play];
        self.isPlay = NO;
    }
}

-(void)nextMusicAction:(UIButton *)button{
    if (self.isPlay == YES) {
        [self.bottomView.pauseMusic setImage:[UIImage imageNamed:@"iconfont-stop-active"] forState:(UIControlStateNormal)];
        [_avPlayer pause];
        self.isPlay = NO;
    }
    NSInteger currentIndex = [self.listArray indexOfObject:self.musicModel];
    NSInteger nextIndex = 0;
    if (currentIndex == self.listArray.count - 1) {
        nextIndex = 0;
    }else{
        nextIndex = currentIndex+1;
    }
    [self handle:nextIndex];
    [self blockAnimation];
}

-(void)handle:(NSInteger)index{
    self.musicModel = self.listArray[index];
    if (self.musicModel != nil) {
        self.avPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:self.musicModel.playUrl64]];
        [_avPlayer replaceCurrentItemWithPlayerItem:self.avPlayerItem];
        [_avPlayer play];
        self.nameLabel.text = self.musicModel.title;
        [self blockAnimation];
        self.groupLabel.text = self.musicModel.nickname;
        [self.smallBackgroundView sd_setImageWithURL:[NSURL URLWithString:self.musicModel.coverLarge] placeholderImage:nil];
        [UIView animateKeyframesWithDuration:2 delay:0 options:(UIViewKeyframeAnimationOptionAllowUserInteraction) animations:^{
            [UIView setAnimationRepeatAutoreverses:YES];
            [UIView setAnimationRepeatCount:NSIntegerMax];
            self.smallBackgroundView.transform = CGAffineTransformMakeRotation(M_PI/4);
            self.smallBackgroundView.transform = CGAffineTransformMakeRotation(M_PI/-4);
        } completion:^(BOOL finished) {
        }];
        self.bottomView.timeLabel.text = [self stringWithTimeInterval:self.musicModel.duration];
    }
}

-(void)blockAnimation{
        [UIView animateWithDuration:2 animations:^{
            self.nameLabel.frame = CGRectMake(self.view.bounds.size.width - 180,self.timeButton.frame.origin.y - 70, 180, 30);
            self.groupLabel.frame = CGRectMake(0,self.timeButton.frame.origin.y - 35, 80, 30);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2 animations:^{
                self.nameLabel.frame = CGRectMake(0,self.timeButton.frame.origin.y - 70, 180, 30);
                self.groupLabel.frame = CGRectMake(self.view.bounds.size.width - 80,self.timeButton.frame.origin.y - 35, 80, 30);
            } completion:^(BOOL finished) {
                    [self blockAnimation];
            }];
    }];
}
//把秒转化为制定格式的字符串
-(NSString *)stringWithTimeInterval : (NSTimeInterval)interval{
    NSInteger m = interval / 60;
    NSInteger s = (NSInteger)interval % 60;
    return [NSString stringWithFormat:@"%02ld: %02ld", m , s];
}

-(void)resolve{
    NSString *url = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/track/detail?device=android&trackId=%ld",self.listFourModel.trackId];
    [NetHandler getDataWithUrl:url completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            pictModel *pict = [[pictModel alloc]init];
            [pict setValuesForKeysWithDictionary:dic];
            self.pictM = pict;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadInputViews];
            });
        });
    }];
}

-(void)setPictM:(pictModel *)pictM{
    _pictM = pictM;
    if (pictM != nil) {
        if (pictM.playUrl64 != nil) {
            self.avPlayerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:pictM.playUrl64]];
            [_avPlayer replaceCurrentItemWithPlayerItem:self.avPlayerItem];
            [_avPlayer play];
            [self.smallBackgroundView sd_setImageWithURL:[NSURL URLWithString:pictM.coverLarge] placeholderImage:nil];
            self.bottomView.timeLabel.text = [self stringWithTimeInterval:pictM.duration];
        }
        else{
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"播放地址出错" message:@"I am sorry" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        }
    }
}
@end
