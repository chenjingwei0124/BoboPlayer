//
//  SearchDetailCell.h
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SongDataBase;

@interface SearchDetailCell : UITableViewCell

@property (nonatomic, strong)UILabel *numberL;
@property (nonatomic, strong)UILabel *songNameL;
@property (nonatomic, strong)UILabel *singerNameL;
@property (nonatomic, strong)UIButton *rightB;

//@property (nonatomic, strong)SongDataBase *songDataBase;
@end
