//
//  SearchDetailCell.m
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SearchDetailCell.h"
#import "SongDataBase.h"

@interface SearchDetailCell ()

@end

@implementation SearchDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.numberL = [[UILabel alloc] init];
        [self.contentView addSubview:self.numberL];
        
        self.songNameL = [[UILabel alloc] init];
        self.songNameL.font = [UIFont systemFontOfSize:15 weight:0.1];
        [self.contentView addSubview:self.songNameL];
        
        self.singerNameL = [[UILabel alloc] init];
        self.singerNameL.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.self.singerNameL];
        
        self.rightB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.rightB];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.numberL.frame = CGRectMake(self.contentView.bounds.size.width/30, self.contentView.bounds.size.height/2 - 10, 30, 20);
    self.songNameL.frame = CGRectMake(self.numberL.frame.origin.x + self.numberL.bounds.size.width, 10, self.contentView.bounds.size.width - self.numberL.frame.origin.x - self.numberL.bounds.size.width - 50, 20);
    self.singerNameL.frame = CGRectMake(self.songNameL.frame.origin.x, self.songNameL.frame.origin.y + self.songNameL.bounds.size.height + 5, self.songNameL.bounds.size.width, 20);
    self.rightB.frame = CGRectMake(self.contentView.bounds.size.width - 50, 0, 50, self.contentView.bounds.size.height);
    [self.rightB setImage:[[UIImage imageNamed:@"iconfont-msnui-down-arrow"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
}

//- (void)setSongDataBase:(SongDataBase *)songDataBase{
//    _songDataBase = songDataBase;
//    
//    if (_songDataBase.auditionList.count == 0) {
//        self.numberL.textColor = [UIColor grayColor];
//        self.songNameL.textColor = [UIColor grayColor];
//        self.singerNameL.textColor = [UIColor grayColor];
//    }
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
