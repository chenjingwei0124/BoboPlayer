//
//  SongsListTableViewCell.m
//  BoboPlayer
//
//  Created by SUN on 15/11/17.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SHRSongsListTableViewCell.h"

@interface SHRSongsListTableViewCell ()





@end


@implementation SHRSongsListTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title1 = [[UILabel alloc]init];
        [self.contentView addSubview:self.title1];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView  addSubview:self.button];
        
    }
    return self;


}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.title1.frame = CGRectMake(15, (self.contentView.frame.size.height - 30 ) / 2, self.contentView.frame.size.width / 2, 30);
    self.button.frame = CGRectMake(self.contentView.frame.size.width - 15 - 15, (self.contentView.frame.size.height - 15 )/2 , 15, 15);
    [self.button setImage:[UIImage imageNamed:@"iconfont-xiaocha"] forState:(UIControlStateNormal)];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
