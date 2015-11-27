//
//  AVPlayerTool.m
//  MyMusic
//
//  Created by sajyy on 15/11/6.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "AVPlayerTool.h"

@implementation AVPlayerTool

static NSMutableDictionary *_soundIDs;

static NSMutableDictionary *_players;
+ (NSMutableDictionary *)soundIDs
{
    if (!_soundIDs) {
        _soundIDs = [NSMutableDictionary dictionary];
    }
    return _soundIDs;
}
+ (NSMutableDictionary *)players
{
    if (!_players) {
        _players = [NSMutableDictionary dictionary];
    }
    return _players;
}


// 播放音效
// 传入需要 播放的音效文件名称
+ (void)playAudioWithURL:(NSString *)URL{
    // 0.判断文件名是否为nil
    if (URL == nil) {
        return;
    }
    
    // 1.从字典中取出音效ID
    SystemSoundID soundID = [[self soundIDs][URL] unsignedIntValue];
    
    // 判断音效ID是否为nil
    if (!soundID) {
        NSLog(@"创建新的soundID");
        
        // 音效ID为nil
        // 根据文件名称加载音效URL
        NSURL *url = [[NSBundle mainBundle] URLForResource:URL withExtension:nil];
        
        // 判断url是否为nil
        if (!url) {
            return;
        }
        
        // 创建音效ID
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        
        // 将音效ID添加到字典中
        [self soundIDs][URL] = @(soundID);
    }
    // 播放音效
    AudioServicesPlaySystemSound(soundID);

}

// 销毁音效
+ (void)disposeAudioWithURL:(NSString *)URL{
    // 0.判断文件名是否为nil
    if (URL == nil) {
        return;
    }
    
    // 1.从字典中取出音效ID
    SystemSoundID soundID = [[self soundIDs][URL] unsignedIntValue];
    
    if (soundID) {
        // 2.销毁音效ID
        AudioServicesDisposeSystemSoundID(soundID);
        
        // 3.从字典中移除已经销毁的音效ID
        [[self soundIDs] removeObjectForKey:URL];
    }

}

// 根据音乐文件名称播放音乐
+ (AVPlayer *)playMusicWithURL:(NSString *)URL{
    
    // 1.从字典中取出播放器
    AVPlayer *player = [self players][URL];
    
    // 2.判断播放器是否为nil
    if (!player) {
        NSLog(@"创建新的播放器");
        
        // 2.1根据文件名称加载音效URL
        NSURL *url = [[NSBundle mainBundle] URLForResource:URL withExtension:nil];
        
        // 2.2判断url是否为nil
        if (!url) {
            return nil;
        }
        // 2.3创建播放器
        player = [[AVPlayer alloc] initWithURL:url];
        
        // 2.5将播放器添加到字典中
        [self players][URL] = player;
        
    }
    // 3.播放音乐
    
        [player play];
    
    return player;

}

// 根据音乐文件名称暂停音乐
+ (void)pauseMusicWithURL:(NSString *)URL{
    // 0.判断文件名是否为nil
    if (URL == nil) {
        return;
    }
    
    // 1.从字典中取出播放器
    AVPlayer *player = [self players][URL];
    
    // 2.判断播放器是否存在
    if(player)
    {
        [player play];
    }
}

// 根据音乐文件名称停止音乐
+ (void)stopMusicWithURL:(NSString *)URL{
    // 0.判断文件名是否为nil
    if (URL == nil) {
        return;
    }
    
    // 1.从字典中取出播放器
    AVPlayer *player = [self players][URL];
    
    // 2.判断播放器是否为nil
    if (player) {
        // 2.1停止播放
        [player pause];
        // 2.2清空播放器
        player = nil;
        // 2.3从字典中移除播放器
        [[self players] removeObjectForKey:URL];
    }
}
@end
