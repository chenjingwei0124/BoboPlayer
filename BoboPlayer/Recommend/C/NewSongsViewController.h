//
//  NewSongsViewController.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/4.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewSong.h"
@interface NewSongsViewController : UIViewController

@property(nonatomic,strong)NewSong *song;
@property(nonatomic,strong)NSString *name;
@end
