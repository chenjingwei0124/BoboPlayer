//
//  RankListTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "RankListTableViewCell.h"

@interface RankListTableViewCell()

@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;
@property(nonatomic,strong)UILabel *lable3;



@end
@implementation RankListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV];
        
        self.title = [[UILabel alloc]init];
        [self.contentView addSubview:self.title];
        
        self.lable1 = [[UILabel alloc]init];
        self.lable1.text = @"1";
        [self.contentView addSubview:self.lable1];
        self.lable2 = [[UILabel alloc]init];
        [self.contentView addSubview:self.lable2];
        self.lable2.text = @"2";
        
        self.lable3 = [[UILabel alloc]init];
        [self.contentView addSubview:self.lable3];
        self.lable3.text = @"3";
        
        self.songLable1 = [[UILabel alloc]init];
        [self.contentView addSubview:self.songLable1];
        
        self.songLable2 = [[UILabel alloc]init];
        [self.contentView addSubview:self.songLable2];
        
        self.songLable3 = [[UILabel alloc]init];
        [self.contentView addSubview:self.songLable3];
        
    }
    return  self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageV.frame = CGRectMake(10, 0, self.contentView.frame.size.width/4, self.contentView.frame.size.width/4);
//    self.imageV.backgroundColor = [UIColor redColor];
    

    self.title.frame = CGRectMake(self.imageV.frame.size.width+15, 0, self.contentView.frame.size.width/2, 30);
//    self.title.backgroundColor = [UIColor redColor];
    
    self.lable1.frame = CGRectMake(self.imageV.frame.size.width+15, 30, 15, 20);
    self.songLable1.frame = CGRectMake(self.imageV.frame.size.width+15+15, 30, self.contentView.frame.size.width/2, 20);
    self.songLable1.font = [UIFont systemFontOfSize:14];
//    self.songLable1.backgroundColor = [UIColor redColor];
    
    self.lable2.frame = CGRectMake(self.imageV.frame.size.width+15, 50, 15, 20);
    self.songLable2.frame = CGRectMake(self.imageV.frame.size.width+15+15, 50, self.contentView.frame.size.width/2, 20);
    self.songLable2.font = [UIFont systemFontOfSize:14];
//    self.songLable2.backgroundColor = [UIColor redColor];
    
    self.lable3.frame = CGRectMake(self.imageV.frame.size.width+15, 70, 15, 20);
    self.songLable3.frame = CGRectMake(self.imageV.frame.size.width+15+15, 70, self.contentView.frame.size.width/2, 20);
    self.songLable3.font = [UIFont systemFontOfSize:14];
//    self.songLable3.backgroundColor = [UIColor redColor];
}
@end
