//
//  MusicListDetailCell.m
//  MyMusic
//
//  Created by sajyy on 15/11/2.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "MusicListDetailCell.h"
#import "UIImageView+WebCache.h"
#import "DetailMusicList.h"

@implementation MusicListDetailCell
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

    
    self.titleLabel.frame = CGRectMake(self.pictView.bounds.size.width + self.pictView.frame.origin.x + 10 , 10, self.bounds.size.width*3/5, 20);
    self.titleLabel.textColor = [UIColor blackColor];

    
    self.describeLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.bounds.size.height + 10,self.bounds.size.width*3/5, 15);
    self.describeLabel.textColor = [UIColor blackColor];
    self.describeLabel.font = [UIFont systemFontOfSize:14];
    
    self.imageV1.frame = CGRectMake(self.describeLabel.frame.origin.x, self.describeLabel.frame.origin.y + self.describeLabel.bounds.size.height + 5, self.bounds.size.width/17,self.bounds.size.width/17);

    
    self.musicNumLabel.frame = CGRectMake(self.imageV1.frame.origin.x+self.imageV1.bounds.size.width +10, self.describeLabel.frame.origin.y + self.describeLabel.bounds.size.height + 12, self.bounds.size.width/15, 10);
    
    self.musicNumLabel.textColor = [UIColor blackColor];
    self.musicNumLabel.font = [UIFont systemFontOfSize:10];
    
    self.imageV2.frame = CGRectMake(self.musicNumLabel.frame.origin.x +self.musicNumLabel.bounds.size.width + 15, self.imageV1.frame.origin.y, self.bounds.size.width/17,self.bounds.size.width/17);
    
    self.playCountsLabel.frame = CGRectMake(self.imageV2.frame.origin.x+self.imageV2.bounds.size.width+10, self.describeLabel.frame.origin.y + self.describeLabel.bounds.size.height + 12, self.bounds.size.width/6, 10);
    
    self.playCountsLabel.textColor = [UIColor blackColor];
    self.playCountsLabel.font = [UIFont systemFontOfSize:10];
    
    self.nextSign.frame = CGRectMake(self.describeLabel.frame.origin.x + self.describeLabel.bounds.size.width + 10, self.describeLabel.frame.origin.y-15, self.bounds.size.width/10 , self.bounds.size.width/10);
}

-(void)setDetailMusicList:(DetailMusicList *)detailMusicList{
    
    _detailMusicList = detailMusicList;
    if (detailMusicList != nil){
        NSString* string = detailMusicList.albumCoverUrl290;
        [self.pictView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
        self.titleLabel.text = detailMusicList.title;
        self.describeLabel.text = detailMusicList.intro;
        self.musicNumLabel.text = [NSString stringWithFormat:@"%ld",detailMusicList.tracksCounts];
        self.playCountsLabel.text = [NSString stringWithFormat:@"%ld",detailMusicList.playsCounts];
        self.imageV1.image = [UIImage imageNamed:@"iconfont-huahui"];
        self.imageV2.image = [UIImage imageNamed:@"iconfont-shoucangicon"];
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
