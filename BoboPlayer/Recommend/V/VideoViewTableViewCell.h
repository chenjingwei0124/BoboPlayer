//
//  VideoViewTableViewCell.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *singerName;
@property(nonatomic,strong)UIImageView *imagePlace;
@property(nonatomic,strong)UILabel *pickCount;
@property(nonatomic,strong)UILabel *commentCount;
@end
