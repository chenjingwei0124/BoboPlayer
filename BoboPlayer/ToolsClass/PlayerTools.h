//
//  PlayerTools.h
//  BoboPlayer
//
//  Created by lanou on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SongData;

@protocol PlayerToolsDelegate <NSObject>

- (void)getBacknowTime:(NSString *)nowTime totalTime:(NSString *)totalTime Progress:(float)progress Duration:(float)duration;
- (void)endMusicPlayer;

@end

@interface PlayerTools : NSObject

@property (nonatomic, strong) SongData *songData;
@property (nonatomic, weak) id<PlayerToolsDelegate> playerToolsDelegate;

+ (instancetype)sharePlayerTools;
- (void)musicPlay;
- (void)musicStop;
- (void)musicPause;
- (void)musicPrePlay;
- (void)musicSeekToTimeWithValue:(float)value;

@end
