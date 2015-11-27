//
//  SingerTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerTableViewCell.h"

@interface SingerTableViewCell()

@property(nonatomic,strong)UIImageView *imageV1;

@end
@implementation SingerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV];
        
        self.imageV1 = [[UIImageView alloc]init];
        self.imageV1.image = [UIImage imageNamed:@"iconfont-gengduo"];
        [self.contentView addSubview:self.imageV1];
        
        self.name = [[UILabel alloc]init];
        [self.contentView addSubview:self.name];
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageV.frame = CGRectMake(5, 5, self.contentView.frame.size.width/4.5, self.contentView.frame.size.width/4.5);
    self.imageV.layer.cornerRadius = self.contentView.frame.size.width/9;
    self.imageV.layer.masksToBounds = YES;
    
    self.name.frame = CGRectMake(5+self.imageV.frame.size.width+10, self.imageV.frame.size.height/3, self.contentView.frame.size.width/2, 30);
    self.name.font = [UIFont systemFontOfSize:15];
    
    self.imageV1.frame = CGRectMake(self.contentView.frame.size.width-30, self.name.frame.origin.y, 20, 20);
    
}
@end
