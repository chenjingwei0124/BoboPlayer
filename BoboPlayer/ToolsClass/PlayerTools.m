//
//  PlayerTools.m
//  BoboPlayer
//
//  Created by lanou on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "PlayerTools.h"
#import "AudioStreamer.h"
#import "SongData.h"

static PlayerTools *playerTools = nil;

@interface PlayerTools ()

@property (nonatomic, strong)AudioStreamer *player;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, assign)CGFloat nowtime;
@end

@implementation PlayerTools

+ (instancetype)sharePlayerTools{
    if (playerTools == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            playerTools = [[PlayerTools alloc] init];
        });
    }
    return playerTools;
}

//初始
- (instancetype)init{
    self = [super init];
    if (self) {
        self.player = nil;
    }
    return self;
}

- (void)musicPrePlay{
    
    NSLog(@"%@ %d", self.songData.songAddress, __LINE__);
    if (self.songData.songAddress == nil) {
        return ;
    }
    NSURL *url = [NSURL URLWithString:self.songData.songAddress];
    
    self.player = [[AudioStreamer alloc] initWithURL:url];
}

- (void)musicPlay{
    [self.player start];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerChange:) userInfo:nil repeats:YES];
}

- (void)musicStop{
    [self.player stop];
}

- (void)musicPause{
    [self.timer invalidate];
    [self.player pause];
}

- (void)musicSeekToTimeWithValue:(float)value{
    [self.player seekToTime:value];
}

- (void)timerChange:(NSTimer *)time{
    
    if (self.player.duration > 0.1) {
        
        NSString *totalTime =[self valueToTimeString:self.player.duration];
        NSString *nowTime = [self valueToTimeString:self.player.progress];
        double progress = self.player.progress;
        double duration = self.player.duration;
        
        if ([self.playerToolsDelegate respondsToSelector:@selector(getBacknowTime:totalTime:Progress:Duration:)] && self.playerToolsDelegate != nil) {
            [self.playerToolsDelegate getBacknowTime:nowTime totalTime:totalTime Progress:progress Duration:duration];
        }
        if ([self.player isIdle] == YES) {
            NSLog(@"结束");
            [self musicStop];
            [self musicPause];
            if ([self.playerToolsDelegate respondsToSelector:@selector(endMusicPlayer)] && self.playerToolsDelegate != nil) {
                [self.playerToolsDelegate endMusicPlayer];
            }
        }
    }
}

//时间格式
- (NSString *)valueToTimeString:(NSInteger)value{
    return [NSString stringWithFormat:@"%.2ld:%.2ld", value/60, value%60];
}

@end
