//
//  AVPlayerTool.h
//  MyMusic
//
//  Created by sajyy on 15/11/6.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerTool : NSObject
// 播放音效
// 传入需要 播放的音效文件名称
+ (void)playAudioWithURL:(NSString *)URL;

// 销毁音效
+ (void)disposeAudioWithURL:(NSString *)URL;

// 根据音乐文件名称播放音乐
+ (AVPlayer *)playMusicWithURL:(NSString *)URL;

// 根据音乐文件名称暂停音乐
+ (void)pauseMusicWithURL:(NSString *)URL;

// 根据音乐文件名称停止音乐
+ (void)stopMusicWithURL:(NSString *)URL;
@end
