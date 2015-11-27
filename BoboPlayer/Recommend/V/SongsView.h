//
//  SongsView.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singer.h"
@interface SongsView : UIView

@property(nonatomic,strong)NSMutableArray *songArr;
@property(nonatomic,strong)Singer *singer;
@property(nonatomic,strong)UITableView *tableV;

@end
