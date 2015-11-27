//
//  MusicsTool.h
//  MyMusic
//
//  Created by sajyy on 15/11/6.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AlbumListModel;

@interface MusicsTool : NSObject

//全部音乐
@property(nonatomic,strong)NSMutableArray *musicArray;

//当前音乐
@property(nonatomic,strong)AlbumListModel *playingMusic;

//获取所有的播放音乐
-(instancetype)initWithMusicArray:(NSMutableArray*)musicArray;

//获取下一首
-(AlbumListModel*)nextMusic;

//获取上一首
-(AlbumListModel *)previousMusic;

@end
