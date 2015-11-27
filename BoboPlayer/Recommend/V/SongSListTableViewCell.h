//
//  SongSListTableViewCell.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongSListTableViewCell : UITableViewCell


@property(nonatomic,strong)UILabel *num;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *singerName;
@property(nonatomic,strong)UIImageView *like;
@property(nonatomic,strong)UILabel *count;
@property(nonatomic,strong)UIButton *xia;
@end
