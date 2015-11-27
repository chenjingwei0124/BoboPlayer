//
//  SingerInfoTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerInfoTableViewCell.h"

@interface SingerInfoTableViewCell()
@property(nonatomic,strong)UILabel *perLable;
@property(nonatomic,strong)UILabel *exerLable;
@property(nonatomic,strong)UILabel *awaLable;

@end
@implementation SingerInfoTableViewCell

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
        self.brief = [[UILabel alloc]init];
        [self.contentView addSubview:self.brief];
        
        self.perLable = [[UILabel alloc]init];
        [self.contentView addSubview:self.perLable];
        
        self.personal = [[UILabel alloc]init];
        [self.contentView addSubview:self.personal];
        
        self.exerLable = [[UILabel alloc]init];
        [self.contentView addSubview:self.exerLable];
        
        self.experience = [[UILabel alloc]init];
        [self.contentView addSubview:self.experience];
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.brief.frame = CGRectMake(10, 10, self.contentView.frame.size.width-10, 30);
    self.brief.font = [UIFont systemFontOfSize:15];
    self.brief.numberOfLines = 0;
    [self.brief sizeToFit];
    
    self.perLable.frame = CGRectMake(10, self.brief.frame.origin.y+self.brief.frame.size.height+10, self.brief.frame.size.width, 30);
    self.perLable.text = @"个人生活";
    
    self.personal.frame = CGRectMake(10, self.perLable.frame.origin.y+30+10, self.brief.frame.size.width, 30);
    self.personal.font = [UIFont systemFontOfSize:15];
    self.personal.numberOfLines = 0;
    [self.personal sizeToFit];
    
    self.exerLable.frame = CGRectMake(10, self.personal.frame.origin.y+self.personal.frame.size.height+10, self.brief.frame.size.height, 30);
    self.exerLable.text = @"演艺经历";
    
    
    self.experience.frame = CGRectMake(10, self.exerLable.frame.origin.y+30+10, self.brief.frame.size.width, 30);
    self.experience.font = [UIFont systemFontOfSize:15];
    self.experience.numberOfLines = 0;
    [self.experience sizeToFit];
    
}
@end
