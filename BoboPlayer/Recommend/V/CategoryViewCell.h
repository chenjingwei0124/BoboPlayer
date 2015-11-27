//
//  CategoryViewCell.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewCell : UITableViewCell


@property(nonatomic,strong)UIImageView *rankListImageV;
@property(nonatomic,strong)UIButton *rankButton;
@property(nonatomic,strong)UIImageView *songListImageV;
@property(nonatomic,strong)UIButton *songButton;
@property(nonatomic,strong)UIImageView *radioImageV;
@property(nonatomic,strong)UIButton *radioButton;
@property(nonatomic,strong)UIImageView *singerImageV;
@property(nonatomic,strong)UIButton *singerButton;

@property(nonatomic,strong)UILabel *rangkListLable;
@property(nonatomic,strong)UILabel *songListLable;
@property(nonatomic,strong)UILabel *radioLable;
@property(nonatomic,strong)UILabel *singerLable;
@end
