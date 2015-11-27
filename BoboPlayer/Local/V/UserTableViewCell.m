//
//  UserTableViewCell.m
//  MPlayer
//
//  Created by SUN on 15/10/27.
//  Copyright (c) 2015年 孙海睿. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userimageView  = [[UIImageView alloc]init];
        [self.contentView addSubview:self.userimageView];
        
        self.userLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.userLabel];
    }
    return self;


}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.userimageView.frame = CGRectMake(10 , self.contentView.frame.size.height / 2 - self.contentView.frame.size.height / 10 * 7 / 2  , self.contentView.frame.size.height / 10 * 7 , self.contentView.frame.size.height / 10 * 7 );
    self.userimageView.layer.cornerRadius = self.contentView.frame.size.height / 10 * 7 / 2;
    self.userimageView.layer.masksToBounds = YES;
//    self.userimageView.backgroundColor = [UIColor redColor];
    
//    self.userLabel.text = @"用户名";
    self.userLabel.frame = CGRectMake(self.userimageView.frame.origin.x + self.userimageView.frame.size.width + 20, self.contentView.frame.size.height / 2 - self.contentView.frame.size.height / 4, self.contentView.frame.size.width / 2 - 10, self.contentView.frame.size.height / 2);
    
    
//    self.userLabel.backgroundColor = [UIColor redColor];
//    self.userLabel.textColor = [UIColor brownColor];
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
