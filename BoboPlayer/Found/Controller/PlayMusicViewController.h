//
//  PlayMusicViewController.h
//  MyMusic
//
//  Created by sajyy on 15/11/4.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class ListFourModel;
@class AlbumListModel;
@interface PlayMusicViewController : BaseViewController

@property(nonatomic,strong)NSMutableArray *listArray;

//刚开始播放的歌曲
@property(nonatomic,strong)AlbumListModel *playingMusic;
@property(nonatomic,strong)ListFourModel *listFourModel;

-(instancetype)initWithPlayingMusic:(AlbumListModel *)isPlayingMusic listArray:(NSMutableArray*)array;
@end
