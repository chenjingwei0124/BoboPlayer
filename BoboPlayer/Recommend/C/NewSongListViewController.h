//
//  NewSongListViewController.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "NewSong.h"
@interface NewSongListViewController : BaseViewController

@property(nonatomic,strong)NewSong *nSong;
@property(nonatomic,strong)NSString *webUrl;
@end