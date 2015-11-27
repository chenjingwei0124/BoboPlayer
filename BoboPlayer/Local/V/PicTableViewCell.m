//
//  PicTableViewCell.m
//  MPlayer
//
//  Created by SUN on 15/10/27.
//  Copyright (c) 2015年 孙海睿. All rights reserved.
//

#import "PicTableViewCell.h"

@interface PicTableViewCell ()
@end
@implementation PicTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageView1 =[[UIImageView alloc]init];
        
        self.imageView1.backgroundColor = [UIColor purpleColor];
        self.imageView1.image = [UIImage imageNamed:@"back.jpg"];
        [self.contentView addSubview:self.imageView1];
    }
    return self;


}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView1.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
