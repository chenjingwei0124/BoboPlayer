//
//  RecommendMVCell.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/5.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "RecommendMVCell.h"
#import "UIImageView+WebCache.h"
#import "MV.h"
#import "MVList.h"

@interface RecommendMVCell ()

@property(nonatomic,retain)UILabel *MVNameLabel;
@property(nonatomic,retain)UILabel *singerLabel;
@property(nonatomic,retain)UIImageView *MVImageView;

@end

@implementation RecommendMVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.MVNameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.MVNameLabel];
        
        self.singerLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.singerLabel];
        
        self.MVImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.MVImageView];
        
    }
    return self;


}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.MVImageView.frame = CGRectMake(5, 5, self.contentView.frame.size.width / 5 * 2, self.contentView.frame.size.height - 2 * 5);
    self.MVImageView.backgroundColor = [UIColor grayColor];
    
    
    self.MVNameLabel.frame = CGRectMake(self.contentView.frame.size.width / 5 * 2 + 10, 10, self.contentView.frame.size.width / 2, 30);
    self.MVNameLabel.font = [UIFont systemFontOfSize:18];


    
    self.singerLabel.frame = CGRectMake(self.MVNameLabel.frame.origin.x, self.MVNameLabel.frame.origin.y + self.MVNameLabel.frame.size.height + 5, self.contentView.frame.size.width / 3, 20);
    self.singerLabel.font = [UIFont systemFontOfSize:13];
    self.singerLabel.textColor = [UIColor grayColor];
    self.singerLabel.alpha = 0.8;



    
    
    

}

-(void)setMv:(MV *)mv{

    _mv = mv;
    [self.MVImageView sd_setImageWithURL:[NSURL URLWithString:mv.mvlist.picUrl]];
    self.singerLabel.text = mv.singerName;
    self.MVNameLabel.text = mv.videoName;
    NSLog(@"%@",mv.mvlist.picUrl);
    NSLog(@"%@",mv.videoName);
    NSLog(@"%@",mv.singerName);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
