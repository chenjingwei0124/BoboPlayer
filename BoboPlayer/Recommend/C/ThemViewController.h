//
//  ThemViewController.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeSong.h"
#import "BaseViewController.h"

@interface ThemViewController : BaseViewController

@property(nonatomic,strong)ThemeSong *song;
@property(nonatomic,strong)NSString *webUrl;

@end
