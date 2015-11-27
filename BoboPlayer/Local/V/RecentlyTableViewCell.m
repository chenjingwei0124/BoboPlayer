//
//  RecentlyTableViewCell.m
//  MPlayer
//
//  Created by SUN on 15/10/27.
//  Copyright (c) 2015年 孙海睿. All rights reserved.
//

#import "RecentlyTableViewCell.h"

@implementation RecentlyTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        self.recentlyLabel = [[UILabel alloc]init];
//        [self.contentView addSubview:self.recentlyLabel];
        
        self.recentlyLabel1 = [[UILabel alloc]init];
        [self.contentView addSubview:self.recentlyLabel1];
        self.recentlyButton1 = [[UIButton  alloc]init];
        [self.contentView addSubview:self.recentlyButton1];
        
        self.recentlyLabel2 = [[UILabel alloc]init];
        [self.contentView addSubview:self.recentlyLabel2];
        self.recentlyButton2 = [[UIButton  alloc]init];
        [self.contentView addSubview:self.recentlyButton2];
        
        self.recentlyLabel3 = [[UILabel alloc]init];
        [self.contentView addSubview:self.recentlyLabel3];
        self.recentlyButton3 = [[UIButton  alloc]init];
        [self.contentView addSubview:self.recentlyButton3];
        
//        self.recentlyLabel4 = [[UILabel alloc]init];
//        [self.contentView addSubview:self.recentlyLabel4];
//        self.recentlyButton4 = [[UIButton  alloc]init];
//        [self.contentView addSubview:self.recentlyButton4];
//        
//        self.recentlyLabel5 = [[UILabel alloc]init];
//        [self.contentView addSubview:self.recentlyLabel5];
//        self.recentlyButton5 = [[UIButton  alloc]init];
//        [self.contentView addSubview:self.recentlyButton5];
    }
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
//    self.recentlyButton.backgroundColor = [UIColor purpleColor];
    

    
    
    //歌单1
    self.recentlyButton1.frame = CGRectMake(self.contentView.frame.size.width / 25, self.contentView.frame.size.height / 2 - self.contentView.frame.size.width / 4 / 2, self.contentView.frame.size.width / 32 * 9, self.contentView.frame.size.width / 32 * 9);
    self.recentlyLabel1.frame = CGRectMake(self.recentlyButton1.frame.origin.x, self.recentlyButton1.frame.origin.y + self.recentlyButton1.frame.size.height + 5, self.recentlyButton1.frame.size.width, 20);
//    self.recentlyLabel1.backgroundColor = [UIColor redColor];
    self.recentlyLabel1.text = @"歌单1";
    self.recentlyLabel1.font = [UIFont systemFontOfSize:15];
    
    //歌单2
    self.recentlyButton2.frame = CGRectMake(self.contentView.frame.size.width / 2 - self.recentlyButton1.frame.size.width / 2, self.recentlyButton1.frame.origin.y, self.recentlyButton1.frame.size.width, self.recentlyButton1.frame.size.width);
    self.recentlyLabel2.frame = CGRectMake(self.recentlyButton2.frame.origin.x, self.recentlyButton2.frame.origin.y + self.recentlyButton2.frame.size.height + 5, self.recentlyButton2.frame.size.width, 20);
//    self.recentlyLabel2.backgroundColor = [UIColor redColor];
//    self.recentlyButton2.backgroundColor = [UIColor redColor];
    self.recentlyLabel2.text = @"歌单2";
    self.recentlyLabel2.font = [UIFont systemFontOfSize:15];
    
    //歌单3
    self.recentlyButton3.frame = CGRectMake(self.contentView.frame.size.width - self.recentlyButton1.frame.size.width - self.contentView.frame.size.width / 25, self.recentlyButton1.frame.origin.y, self.recentlyButton1.frame.size.width, self.recentlyButton1.frame.size.width);
    self.recentlyLabel3.frame = CGRectMake(self.recentlyButton3.frame.origin.x, self.recentlyButton3.frame.origin.y + self.recentlyButton3.frame.size.height + 5, self.recentlyButton3.frame.size.width, 20);
//    self.recentlyButton3.backgroundColor = [UIColor redColor];
//    self.recentlyLabel3.backgroundColor = [UIColor redColor];
    self.recentlyLabel3.text = @"歌单3";
    self.recentlyLabel3.font = [UIFont systemFontOfSize:15];
    
   

    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
