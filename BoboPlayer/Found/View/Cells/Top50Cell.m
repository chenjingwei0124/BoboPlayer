//
//  Top50Cell.m
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "Top50Cell.h"
#import "DetailMusicList.h"
#import "UIImageView+WebCache.h"

@implementation Top50Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pictView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.pictView];
        
        self.titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel];
        
        self.describeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.describeLabel];
        
        self.musicNumLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.musicNumLabel];
        
        self.playCountsLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.playCountsLabel];
        
        self.nextSign = [[UIImageView alloc]init];
        [self.contentView addSubview:self.nextSign];
        
        self.imageV1 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV1];
        
        self.imageV2 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV2];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.pictView.frame = CGRectMake(10, 10, self.bounds.size.width/5, self.bounds.size.width/5);
    self.pictView.backgroundColor = [UIColor grayColor];
    
    self.titleLabel.frame = CGRectMake(self.pictView.bounds.size.width + self.pictView.frame.origin.x + 10 , 10, self.bounds.size.width*3/5, 20);
    self.titleLabel.textColor = [UIColor blackColor];
    
    self.describeLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.bounds.size.height + 10,self.bounds.size.width*3/5, 15);
    self.describeLabel.textColor = [UIColor blackColor];
    self.describeLabel.font = [UIFont systemFontOfSize:14];
    
    self.imageV1.frame = CGRectMake(self.describeLabel.frame.origin.x, self.describeLabel.frame.origin.y + self.describeLabel.bounds.size.height + 5, self.bounds.size.width/17,self.bounds.size.width/17);
    
    
    self.musicNumLabel.frame = CGRectMake(self.imageV1.frame.origin.x+self.imageV1.bounds.size.width +10, self.describeLabel.frame.origin.y + self.describeLabel.bounds.size.height + 12, self.bounds.size.width/5, 10);
    
    self.musicNumLabel.textColor = [UIColor blackColor];
    self.musicNumLabel.font = [UIFont systemFontOfSize:10];

    
    self.nextSign.frame = CGRectMake(self.describeLabel.frame.origin.x + self.describeLabel.bounds.size.width + 10, self.describeLabel.frame.origin.y-15, self.bounds.size.width/10 , self.bounds.size.width/10);
}

-(void)setDetailMusicList:(DetailMusicList *)detailMusicList{
    _detailMusicList = detailMusicList;
    if (detailMusicList != nil) {
        NSString *url = detailMusicList.coverMiddle;
        [self.pictView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
        self.titleLabel.text = detailMusicList.title;
        self.describeLabel.text = detailMusicList.tags;
        self.imageV1.image = [UIImage imageNamed:@"iconfont-huahui"];
        self.musicNumLabel.text = [NSString stringWithFormat:@"%ld集",detailMusicList.tracksCounts];
    }

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
