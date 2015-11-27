//
//  SongsListTableViewCell.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SongListCell.h"

@implementation SongListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageView1 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView1];
        
        self.label1 = [[UILabel alloc]init];
        [self.contentView addSubview:self.label1];
        
        
    }
    return self;

}
-(void)layoutSubviews{
    [super layoutSubviews];

    self.imageView1.frame = CGRectMake(self.contentView.frame.size.width / 20, self.contentView.frame.size.height / 2 - self.contentView.frame.size.height / 20 * 12 / 2, self.contentView.frame.size.height / 20 * 12  , self.contentView.frame.size.height / 20 * 12);
    
    self.label1.frame = CGRectMake(self.contentView.frame.size.width / 20 + self.contentView.frame.size.height / 20 * 12 + 10, self.contentView.frame.size.height / 2 - 30 / 2, self.contentView.frame.size.width / 2 , 30);

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
