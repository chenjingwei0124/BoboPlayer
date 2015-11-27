//
//  SongsMainViewController.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongList.h"
#import "HotSong.h"
#import "NewSong.h"
#import "BaseViewController.h"

@interface SongsMainViewController : BaseViewController
@property(nonatomic,strong)SongList *list;
@property(nonatomic,strong)HotSong *song;
@property(nonatomic,strong)NewSong *songNew;

@end
