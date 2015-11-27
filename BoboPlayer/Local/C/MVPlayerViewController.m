//
//  MVPlayerViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/4.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MVPlayerViewController.h"
#import "MVPlayerView.h"
#import "MV.h"
#import "NetHandler.h"
#import "MVList.h"
#import "RecommendMVCell.h"

@interface MVPlayerViewController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL _played;
    BOOL _big;
    BOOL _isButtonsShow;
    NSString *_totalTime;
    NSDateFormatter *_dateFormatter;
    
}


@property(nonatomic,retain)AVPlayerItem *playerItem;
@property(nonatomic,retain)UIButton *stateButton;
@property(nonatomic,retain)MVPlayerView *mvPlayerView;
@property(nonatomic,retain)AVPlayer *player;
@property(nonatomic,weak)id playbackTimeObserver;
@property(nonatomic,retain)UISlider *videoSlider;
@property(nonatomic,retain)UILabel *timeLabel;
@property(nonatomic,retain)UIProgressView *videoProgress;
@property(nonatomic,retain)UIButton *backButton;
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,copy)NSString *MVURL;
@property(nonatomic,retain)UITableView *mvTableView;
@property(nonatomic,retain)UIButton *bigButton;
@end

@implementation MVPlayerViewController

//-(void)viewWillAppear:(BOOL)animated{
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"musicPlayerShow" object:@"NO"];
//
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    _isButtonsShow = YES;

    if (self.mv.mvlist.url == nil) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"由于版权原因,该MV不能播放" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else{
    
    
        [self handle];
        
        [self addMVPlay];
        
        self.stateButton.enabled = NO ;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMVPlayer:)];
        [self.mvPlayerView addGestureRecognizer:tapGestureRecognizer];
        

    
    
    }
        //    [self handle];
    
}
-(void)addMVPlay{
   
    
    
        self.MVURL = self.mv.mvlist.url;
        self.view.backgroundColor = [UIColor whiteColor];
        
        NSURL *videoUrl = [NSURL URLWithString:_MVURL];
        self.playerItem = [AVPlayerItem playerItemWithURL:videoUrl];
        
        self.mvPlayerView = [[MVPlayerView alloc]initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9))];
        self.mvPlayerView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:self.mvPlayerView];
        
        [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];// 监听status属性
        
        [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];// 监听loadedTimeRanges属性
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        self.mvPlayerView.player = _player;
        self.stateButton.enabled = NO;
        
        // 添加视频播放结束通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:_playerItem];
        
        
        
        
        
        
        self.stateButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.stateButton.frame = CGRectMake(10, self.mvPlayerView.frame.size.height/ 32 * 27, 30, 30);
        //    [self.stateButton setTitle:@"播放" forState:(UIControlStateNormal)];
        [self.stateButton setImage:[UIImage imageNamed:@"iconfont-mvplay"] forState:(UIControlStateNormal)];
        [self.stateButton addTarget:self action:@selector(stateButtonTouched:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.mvPlayerView addSubview:self.stateButton];
        
        
    
        
        //timeLabel 当前播放时间/总时间
        self.timeLabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.mvPlayerView.frame.size.width - 75, self.mvPlayerView.frame.size.height - 40, 80, 40))];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor whiteColor];
        [self.mvPlayerView addSubview:self.timeLabel];
        
        //slider
        self.videoSlider = [[UISlider alloc]initWithFrame:(CGRectMake(45, self.mvPlayerView.frame.size.height - 40, self.mvPlayerView.frame.size.width - 45 - 80, 40))];
        self.videoSlider.minimumTrackTintColor = [UIColor redColor];
//        //滑块拖动时的事件
//        [self.videoSlider addTarget:self action:@selector(videoSlierChangeValueEnd:) forControlEvents:(UIControlEventValueChanged)];
//        //滑动拖动后的事件
//        [self.videoSlider addTarget:self action:@selector(videoSlierChangeValue:) forControlEvents:UIControlEventTouchUpInside];
    
    //滑块拖动时的事件
    [self.videoSlider addTarget:self action:@selector(videoSlierChangeValue:) forControlEvents:(UIControlEventValueChanged)];
    //滑动拖动后的事件
    [self.videoSlider addTarget:self action:@selector(videoSlierChangeValueEnd:) forControlEvents:UIControlEventTouchUpInside];
    
        //注意这里要加UIControlStateHightlighted的状态，否则当拖动滑块时滑块将变成原生的控件
        self.videoSlider.thumbTintColor = [UIColor redColor];
        [self.videoSlider setThumbImage:[UIImage imageNamed:@"iconfont-mvSlider"] forState:UIControlStateHighlighted];
        [self.videoSlider setThumbImage:[UIImage imageNamed:@"iconfont-mvSlider"] forState:UIControlStateNormal];
        
        
        //缓冲条
        self.videoProgress = [[UIProgressView alloc]initWithProgressViewStyle:(UIProgressViewStyleDefault)];
        self.videoProgress.frame = CGRectMake(self.videoSlider.frame.origin.x, self.videoSlider.frame.origin.y + self.videoSlider.frame.size.height / 2, self.videoSlider.frame.size.width, 40);
        [self.mvPlayerView addSubview:self.videoProgress];
        [self.mvPlayerView addSubview:self.videoSlider];
        
        //返回按钮
        self.backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.backButton setBackgroundImage:[UIImage imageNamed:@"iconfont-mvback"] forState:(UIControlStateNormal)];
        self.backButton.frame = CGRectMake(10, 20, 30, 30);
        //    [backButton setTitle:@"返回" forState:(UIControlStateNormal)];
        [self.backButton addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.mvPlayerView addSubview:self.backButton];

        //全屏按钮
        self.bigButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.bigButton.frame = CGRectMake(self.view.frame.size.width - 30 - 30, self.backButton.frame.origin.y, 30, 30);
        [self.bigButton setImage:[UIImage imageNamed:@"iconfont-quanpingxianshi"] forState:(UIControlStateNormal)];
        [self.bigButton addTarget:self action:@selector(bigAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.mvPlayerView addSubview:self.bigButton];

    
}
-(void)bigAction:(UIButton *)button{


    
    if (!_big) {
        
        self.stateButton.frame = CGRectMake(10, self.mvPlayerView.frame.size.width - 35, 30, 30);
        self.videoSlider.frame = CGRectMake(45, self.mvPlayerView.frame.size.width - 40, self.view.frame.size.height - 45 - 80,40);
        
        self.videoProgress.frame = CGRectMake(self.videoSlider.frame.origin.x, self.videoSlider.frame.origin.y + self.videoSlider.frame.size.height / 2, self.videoSlider.frame.size.width, 40);
        
        self.bigButton.frame = CGRectMake(self.view.frame.size.height - 30 - 30, self.backButton.frame.origin.y , 30, 30);
        
        self.timeLabel.frame = CGRectMake(self.videoSlider.frame.origin.x + self.videoSlider.frame.size.width , self.mvPlayerView.frame.size.width - 40, 80, 40);
        
        self.mvPlayerView.transform = CGAffineTransformIdentity;
        self.mvPlayerView.transform = CGAffineTransformMakeRotation(M_PI * (90)/180);
        self.mvPlayerView.frame = self.view.frame;
        [self.view bringSubviewToFront:self.mvPlayerView];
        _big = !_big;
    }else{
    
       
        
        
        self.mvPlayerView.transform = CGAffineTransformIdentity;
        self.mvPlayerView.transform = CGAffineTransformMakeRotation(0);
        self.mvPlayerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9);
    
        self.stateButton.frame = CGRectMake(10, self.mvPlayerView.frame.size.height/ 32 * 27, 30, 30);
        self.videoSlider.frame = CGRectMake(45, self.mvPlayerView.frame.size.height - 40, self.mvPlayerView.frame.size.width - 45 - 80, 40);
        self.videoProgress.frame = CGRectMake(self.videoSlider.frame.origin.x, self.videoSlider.frame.origin.y + self.videoSlider.frame.size.height / 2, self.videoSlider.frame.size.width, 40);
        self.bigButton.frame = CGRectMake(self.view.frame.size.width - 30 - 30, self.backButton.frame.origin.y, 30, 30);
        self.timeLabel.frame = CGRectMake(self.mvPlayerView.frame.size.width - 75, self.mvPlayerView.frame.size.height - 40, 80, 40);
        
        
        _big = !_big;
    
    
    }
    

    
//    self.stateButton.frame = CGRectMake(10, self.mvPlayerView.frame.size.height/ 32 * 27, 30, 30);
//    self.stateButton.frame = CGRectMake(10, self.view.frame.size.height / 32 / 27, 30, 30);
    
    
    






}
-(void)creatTableView{

    self.mvTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.width / 16 * 9, self.view.bounds.size.width, self.view.bounds.size.height - self.view.bounds.size.width / 16 * 9) style:(UITableViewStylePlain)];
    self.mvTableView.delegate = self;
    self.mvTableView.dataSource = self;

    [self.view addSubview:self.mvTableView];

//recommend

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *resuseIndentifier = @"cell1";
    
    RecommendMVCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
    
    if (cell == nil) {
        cell = [[RecommendMVCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
    }
    
    cell.mv = self.array[indexPath.row];
    
    return cell;


}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.mvTableView.frame.size.height / 4.5;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

        
        if (_played) {
            
            _played = !_played;
        }
        
        
        
        [self.playerItem removeObserver:self forKeyPath:@"status" context:nil];
        [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.playerItem];
        [self.mvPlayerView.player removeTimeObserver:self.playbackTimeObserver];
        
        [self.mvPlayerView removeFromSuperview];
        
        self.mv = self.array[indexPath.row];
        [self addMVPlay];
    
    _isButtonsShow = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMVPlayer:)];
    [self.mvPlayerView addGestureRecognizer:tapGestureRecognizer];
    [self handle];
    [self.mvTableView reloadData];


//    MVPlayerViewController *newVC = [[MVPlayerViewController alloc]init];
//    newVC.mv = self.array [indexPath.row];
//    [self.navigationController pushViewController:newVC animated:YES];
}


-(void)handle{
    
    self.array = [NSMutableArray array];

    NSString *url = [NSString stringWithFormat:@"http://api.dongting.com/sim/mv/%@/similarity?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2",self.mv.ID];
    
    [NetHandler getDataWithUrl:url completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
            NSArray *arr = [dic objectForKey:@"data"];
            for (NSDictionary *dd in arr) {
                MV *mv = [[MV alloc]init];
                [mv setValuesForKeysWithDictionary:dd];
                [self.array addObject:mv];
                
            }

        [self creatTableView];
        [self.mvTableView reloadData];
    }];

 
}


//轻触avplayer
-(void)tapMVPlayer:(UIButton *)button{


    if (_isButtonsShow) {
        self.stateButton.alpha = 0;
        self.videoSlider.alpha = 0;
        self.videoProgress.alpha = 0;
        self.bigButton.alpha = 0;
        self.backButton.alpha = 0;
        self.timeLabel.alpha = 0;
        _isButtonsShow = !_isButtonsShow;
    }else{
    
    
        self.stateButton.alpha = 1;
        self.videoSlider.alpha = 1;
        self.videoProgress.alpha = 1;
        self.bigButton.alpha = 1;
        self.backButton.alpha = 1;
        self.timeLabel.alpha = 1;
        _isButtonsShow = !_isButtonsShow;
    
    }
    

}


-(void)viewWillDisappear:(BOOL)animated{

    [self.playerItem removeObserver:self forKeyPath:@"status" context:nil];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.playerItem];
    [self.mvPlayerView.player removeTimeObserver:self.playbackTimeObserver];
    


}
-(void)back:(UIButton *)button{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)monitoringPlayback:(AVPlayerItem *)playerItem {
    
    __weak typeof(self) weakSelf = self;
    self.playbackTimeObserver = [self.mvPlayerView.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:NULL usingBlock:^(CMTime time) {
        CGFloat currentSecond = playerItem.currentTime.value/playerItem.currentTime.timescale;// 计算当前在第几秒
        [weakSelf.videoSlider setValue:currentSecond animated:YES];
        NSString *timeString = [self convertTime:currentSecond];
        weakSelf.timeLabel.text = [NSString stringWithFormat:@"%@/%@",timeString,_totalTime];
    }];
}
- (NSString *)convertTime:(CGFloat)second{
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:second];
    if (second/3600 >= 1) {
        [[self dateFormatter] setDateFormat:@"HH:mm:ss"];
    } else {
        [[self dateFormatter] setDateFormat:@"mm:ss"];
    }
    NSString *showtimeNew = [[self dateFormatter] stringFromDate:d];
    return showtimeNew;
}
- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}



//--------------------------------------------------------------

// KVO方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            //当status 等于 AVPlayerStatusReadyToPlay 时,代表视频可以播放
            NSLog(@"AVPlayerStatusReadyToPlay");
            self.stateButton.enabled = YES;
            CMTime duration = self.playerItem.duration;// 获取视频总长度
            CGFloat totalSecond = playerItem.duration.value / playerItem.duration.timescale;// 转换成秒
            _totalTime = [self convertTime:totalSecond];// 转换成播放时间
            [self customVideoSlider:duration];// 自定义UISlider外观
            NSLog(@"movie total duration:%f",CMTimeGetSeconds(duration));
            [self monitoringPlayback:self.playerItem];// 监听播放状态
        } else if ([playerItem status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
            self.stateButton.enabled = NO;

        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        //loadedTimeRange属性代表已经缓冲的进度，监听此属性可以在UI中更新缓冲进度
        NSTimeInterval timeInterval = [self availableDuration];// 计算缓冲进度
        NSLog(@"Time Interval:%f",timeInterval);
        CMTime duration = _playerItem.duration;
        CGFloat totalDuration = CMTimeGetSeconds(duration);
        [self.videoProgress setProgress:timeInterval / totalDuration animated:YES];
    }
}

- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [[self.mvPlayerView.player currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
}

- (void)customVideoSlider:(CMTime)duration {
    self.videoSlider.maximumValue = CMTimeGetSeconds(duration);
    UIGraphicsBeginImageContextWithOptions((CGSize){ 1, 1 }, NO, 0.0f);
    UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.videoSlider setMinimumTrackImage:transparentImage forState:UIControlStateNormal];
    [self.videoSlider setMaximumTrackImage:transparentImage forState:UIControlStateNormal];
}


//-----------------------------------------------
- (IBAction)videoSlierChangeValue:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSLog(@"value change:%f",slider.value);
    
    if (slider.value == 0.000000) {
        __weak typeof(self) weakSelf = self;
        [self.mvPlayerView.player seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
            [weakSelf.mvPlayerView.player play];
        }];
    }
}

- (IBAction)videoSlierChangeValueEnd:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSLog(@"value end:%f",slider.value);
    CMTime changedTime = CMTimeMakeWithSeconds(slider.value, 1);
    
    __weak typeof(self) weakSelf = self;
    [self.mvPlayerView.player seekToTime:changedTime completionHandler:^(BOOL finished) {
        [weakSelf.mvPlayerView.player play];
//        [weakSelf.stateButton setTitle:@"暂停" forState:UIControlStateNormal];
        [weakSelf.stateButton setImage:[UIImage imageNamed:@"iconfont-mvstop"] forState:(UIControlStateNormal)];
    }];
}

- (void)updateVideoSlider:(CGFloat)currentSecond {
    [self.videoSlider setValue:currentSecond animated:YES];
}


- (void)moviePlayDidEnd:(NSNotification *)notification {
    NSLog(@"Play end");
    
    __weak typeof(self) weakSelf = self;
    [self.mvPlayerView.player seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
        [weakSelf.videoSlider setValue:0.0 animated:YES];
//        [weakSelf.stateButton setTitle:@"播放" forState:UIControlStateNormal];
        [weakSelf.stateButton setImage:[UIImage imageNamed:@"iconfont-mvplay"] forState:(UIControlStateNormal)];
    }];
}




//---------------------------------------------------
//播放按钮 响应
- (IBAction)stateButtonTouched:(id)sender {
    if (!_played) {
        [self.mvPlayerView.player play];
//        [self.stateButton setTitle:@"暂停" forState:UIControlStateNormal];
        [self.stateButton setImage:[UIImage imageNamed:@"iconfont-mvstop"] forState:(UIControlStateNormal)];
    } else {
        [self.mvPlayerView.player pause];
//        [self.stateButton setTitle:@"播放" forState:UIControlStateNormal];
        [self.stateButton setImage:[UIImage imageNamed:@"iconfont-mvplay"] forState:(UIControlStateNormal)];
    }
    
    
    
    //    degreeTOradians()定义一个宏。
//#define degreeTOradians(x) (M_PI * (x)/180)

    
    
    _played = !_played;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
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
