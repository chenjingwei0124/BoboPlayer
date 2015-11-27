//
//  ThemeCollectionViewCell.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeSong.h"
@interface ThemeCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *imageV1;
@property(nonatomic,strong)UILabel *name1;
@property(nonatomic,strong)UILabel *desc1;
@property(nonatomic,strong)ThemeSong *song;

@end
