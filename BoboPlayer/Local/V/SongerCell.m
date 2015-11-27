//
//  SongerCell.m
//  UI_BoboPlayer
//
//  Created by lanou on 15/10/30.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SongerCell.h"

@interface SongerCell ()

@end

@implementation SongerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameL = [[UILabel alloc] init];
        self.nameL.font = [UIFont systemFontOfSize:15 weight:0.2];
        [self.contentView addSubview:self.nameL];
        
        self.authorL = [[UILabel alloc] init];
        self.authorL.font = [UIFont systemFontOfSize:13];
        self.authorL.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.authorL];
        
        self.setlowB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.setlowB];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameL.frame = CGRectMake(self.contentView.bounds.size.width/30, 10, self.contentView.bounds.size.width - 50, 20);
    self.authorL.frame = CGRectMake(self.nameL.frame.origin.x, self.nameL.frame.origin.y + self.nameL.bounds.size.height + 5, self.nameL.bounds.size.width, 20);
    self.setlowB.frame = CGRectMake(self.contentView.bounds.size.width - 50, 0, 50, self.contentView.bounds.size.height);
    [self.setlowB setImage:[[UIImage imageNamed:@"iconfont-shanchu"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] forState:(UIControlStateNormal)];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
