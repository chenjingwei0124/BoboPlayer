//
//  MusicsTool.m
//  MyMusic
//
//  Created by sajyy on 15/11/6.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "MusicsTool.h"
#import "AlbumListModel.h"

@implementation MusicsTool

//初始化获取所有音乐
-(instancetype)initWithMusicArray:(NSMutableArray *)musicArray{
    self = [super init];
    if (self != nil) {
        _musicArray = [NSMutableArray arrayWithArray:musicArray];
    }
    return self;
}

//上一首
-(AlbumListModel *)nextMusic{
    //1.获取当前播放音乐的引用
    NSInteger currentIndex = [self.musicArray indexOfObject:_playingMusic];
    
    //2.计算下一首的索引
    NSInteger nextIndex = currentIndex + 1;
    
    //3.越界处理
    if (nextIndex >= self.musicArray.count) {
        nextIndex = 0;
    }
    
    //4.取出下一首的模型返回
    return self.musicArray[nextIndex];
}

//下一首
-(AlbumListModel *)previousMusic{
    // 1.获取当前播放的索引
    NSUInteger currentIndex = [self.musicArray indexOfObject:_playingMusic];
    
    // 2.计算上一首的索引
    NSInteger perviouesIndex = currentIndex - 1;
    
    // 3.越界处理
    if (perviouesIndex < 0) {
        perviouesIndex = [self.musicArray count] - 1;
    }
    
    // 4.取出下一首的模型返回
    return self.musicArray[perviouesIndex];
}

@end
