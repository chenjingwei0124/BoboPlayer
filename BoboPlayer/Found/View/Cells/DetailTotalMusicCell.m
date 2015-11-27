//
//  DetailTotalMusicCell.m
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "DetailTotalMusicCell.h"
#import "AlbumListModel.h"


@implementation DetailTotalMusicCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.titleImageView];
        
        self.titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel];
        
        self.personImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.personImageView];
        
        self.personCountLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.personCountLabel];
        
        self.timeImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.timeImageView];
        
        self.timeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.timeLabel];
        
        self.commentImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.commentImageView];
        
        self.commentLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.commentLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.titleImageView.frame = CGRectMake(10, 10, self.bounds.size.width/10, self.bounds.size.width/10);
//    self.titleImageView.backgroundColor = [UIColor grayColor];
    
    self.titleLabel.frame = CGRectMake(self.titleImageView.frame.origin.x + self.titleImageView.bounds.size.width+10, self.titleImageView.frame.origin.y, self.bounds.size.width*2/3, self.titleImageView.bounds.size.height);
//    self.titleLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    
    self.personImageView.frame = CGRectMake(self.titleImageView.frame.origin.x, self.titleImageView.bounds.size.height + self.titleImageView.frame.origin.y + 10, self.titleImageView.bounds.size.height*2/3, self.titleImageView.bounds.size.height*2/3);
//    self.personImageView.backgroundColor = [UIColor grayColor];
    
    self.personCountLabel.frame = CGRectMake(self.personImageView.frame.origin.x + self.personImageView.bounds.size.width, self.personImageView.frame.origin.y, 2*self.personImageView.bounds.size.width, self.personImageView.bounds.size.height);
//    self.personCountLabel.backgroundColor = [UIColor grayColor];
    self.personCountLabel.textAlignment = NSTextAlignmentCenter;
    self.personCountLabel.textColor = [UIColor blackColor];
    
    self.timeImageView.frame = CGRectMake(self.personCountLabel.frame.origin.x+self.personCountLabel.bounds.size.width + 10 , self.personCountLabel.frame.origin.y, self.personImageView.bounds.size.width, self.personImageView.bounds.size.width);
//    self.timeImageView.backgroundColor = [UIColor grayColor];
    
    self.timeLabel.frame = CGRectMake(self.timeImageView.frame.origin.x+self.timeImageView.bounds.size.width , self.timeImageView.frame.origin.y, self.personCountLabel.bounds.size.width, self.personCountLabel.bounds.size.height);
//    self.timeLabel.backgroundColor = [UIColor grayColor];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.textColor = [UIColor blackColor];
    
    self.commentImageView.frame = CGRectMake(self.timeLabel.frame.origin.x + self.timeLabel.bounds.size.width + 10 , self.timeLabel.frame.origin.y, self.timeImageView.bounds.size.width, self.timeLabel.bounds.size.height);
//    self.commentImageView.backgroundColor = [UIColor grayColor];
    
    self.commentLabel.frame = CGRectMake(self.commentImageView.frame.origin.x + self.commentImageView.bounds.size.width , self.commentImageView.frame.origin.y, self.timeLabel.bounds.size.width, self.timeLabel.bounds.size.height);
//    self.commentLabel.backgroundColor = [UIColor grayColor];
    self.commentLabel.textColor = [UIColor blackColor];
    
}

-(void)setAlbumListModel:(AlbumListModel *)albumListModel{
    _albumListModel = albumListModel;
    if (albumListModel != nil) {
        self.titleLabel.text = albumListModel.title;
        self.personCountLabel.text = [NSString stringWithFormat:@"%ld",albumListModel.playtimes];
        NSInteger min = albumListModel.duration / 60;
        NSInteger sec = albumListModel.duration % 60;
        self.timeLabel.text = [NSString stringWithFormat:@"%ld:%0.2ld",min,sec];
        self.commentLabel.text = [NSString stringWithFormat:@"%ld",albumListModel.comments];
    }
    self.titleImageView.image = [UIImage imageNamed:@"iconfont-bargraph2"];
    self.personImageView.image = [UIImage imageNamed:@"iconfont-iconfontsanjiao3"];
    self.timeImageView.image = [UIImage imageNamed:@"iconfont-shijian"];
    self.commentImageView.image = [UIImage imageNamed:@"iconfont-iconfontleijipingjia"];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
