//
//  LikeTableViewCell.m
//  MPlayer
//
//  Created by SUN on 15/10/27.
//  Copyright (c) 2015年 孙海睿. All rights reserved.
//

#import "LikeTableViewCell.h"

@implementation LikeTableViewCell

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
    

    self.imageView1.frame = CGRectMake(self.contentView.frame.size.width / 20, self.contentView.frame.size.height / 2 - self.contentView.frame.size.width / 8, self.contentView.frame.size.width / 4, self.contentView.frame.size.width / 4);
    
    self.imageView1.backgroundColor = [UIColor redColor];
    
    
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
