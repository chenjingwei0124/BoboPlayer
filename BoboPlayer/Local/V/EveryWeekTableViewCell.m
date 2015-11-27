//
//  EveryWeekTableViewCell.m
//  BoboPlayer
//
//  Created by SUN on 15/11/16.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "EveryWeekTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation EveryWeekTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.likeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.likeLabel];
        self.imageView1 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView1];
        
        
    }
    return self;
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
//    self.imageView1.frame = CGRectMake(self.contentView.frame.size.width / 20, self.contentView.frame.size.height / 2 - self.contentView.frame.size.width / 8, self.contentView.frame.size.width - self.contentView.frame.size.width / 10, self.contentView.frame.size.width / 3);
    self.imageView1.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);

    
    self.imageView1.backgroundColor = [UIColor redColor];
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:@"http://b.hiphotos.baidu.com/ting/pic/item/aa18972bd40735fa70a73d5d98510fb30e2408fa.jpg"]];
    
    //    self.likeLabel.text = @"每周精彩推荐";
    self.likeLabel.frame = CGRectMake(self.imageView1.frame.origin.x + self.imageView1.frame.size.width + 20 , self.contentView.frame.size.height / 2 - 15  , 150, 30);
    
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
