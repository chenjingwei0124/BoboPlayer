//
//  MusicDetailCell.m
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "MusicDetailCell.h"
#import "ListThreeTModel.h"
#import "listTwoModel.h"
@interface MusicDetailCell()
@property (nonatomic,strong) UIImageView *signLabel;
@property (nonatomic,strong) UILabel *moreLabel;
@property (nonatomic,strong) UIImageView *pictView;
@end

@implementation MusicDetailCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.signLabel = [[UIImageView alloc]init];
        [self.contentView addSubview:self.signLabel];
        
        self.titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel];
        
        self.moreLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.moreLabel];
        
        self.pictView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.pictView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.signLabel.frame = CGRectMake(10, 10, 30, 30);
    
    self.titleLabel.frame = CGRectMake(self.signLabel.frame.origin.x+self.signLabel.bounds.size.width+10, 10, self.bounds.size.width/2+40, 30);
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.moreLabel.frame = CGRectMake(self.titleLabel.bounds.size.width + self.titleLabel.frame.origin.x +10, 10, 30, 30);

    self.moreLabel.textColor = [UIColor blackColor];
    self.moreLabel.textAlignment = NSTextAlignmentCenter;
    self.moreLabel.font = [UIFont systemFontOfSize:15];
    
    self.pictView.frame = CGRectMake(self.moreLabel.frame.origin.x +self.moreLabel.bounds.size.width + 10, 10, 30, 30);

}

-(void)setListTwoM:(listTwoModel *)listTwoM{
    _listTwoM = listTwoM;
    if (listTwoM != nil) {
            self.signLabel.image = [UIImage imageNamed:@"iconfont-right"];
            self.titleLabel.text = listTwoM.title;
            self.moreLabel.text = @"更多";
            self.pictView.image = [UIImage imageNamed:@"iconfont-iconnext"];
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
