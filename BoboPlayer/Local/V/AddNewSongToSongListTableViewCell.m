//
//  AddNewSongToSongListTableViewCell.m
//  BoboPlayer
//
//  Created by SUN on 15/11/16.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "AddNewSongToSongListTableViewCell.h"

@interface AddNewSongToSongListTableViewCell ()

@property (nonatomic,retain) UILabel *addLabel;
@property (nonatomic,retain) UIImageView *addImageView;


@end


@implementation AddNewSongToSongListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.addLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.addLabel];

        self.addImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.addImageView];
        
    }
    return self;
    
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    self.addImageView.frame = CGRectMake(30, (self.contentView.frame.size.height - self.contentView.frame.size.height / 5 * 3) / 2  , self.contentView.frame.size.height / 5 * 3 , self.contentView.frame.size.height / 5 * 3);
    self.addImageView.image = [UIImage imageNamed:@"iconfont-jiagedan"];
    
    self.addLabel.frame = CGRectMake(10 + self.addImageView.frame.size.width + self.addImageView.frame.origin.x, (self.contentView.frame.size.height - 30) / 2, self.contentView.frame.size.width / 10 * 5, 30);
//    self.addLabel.backgroundColor = [UIColor grayColor];
    
    self.addLabel.text = @"添加新歌曲";
    
    
}

@end
