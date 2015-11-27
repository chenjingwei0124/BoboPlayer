//
//  SetView.m
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "SetView.h"
#import "AlbumIdModel.h"

@implementation SetView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.totalSetLabel = [[UILabel alloc]init];
        [self addSubview:self.totalSetLabel];
        
        self.selectView = [[UIImageView alloc]init];
        [self addSubview:self.selectView];
        
        self.selectButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:self.selectButton];
        
        self.relationView = [[UIImageView alloc]init];
        [self addSubview:self.relationView];
        
        self.relationButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:self.relationButton];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.totalSetLabel.frame = CGRectMake(20, 10, 80, 30);
    self.totalSetLabel.textColor = [UIColor whiteColor];
    self.totalSetLabel.textAlignment = NSTextAlignmentCenter;
    
    self.selectView.frame = CGRectMake(200, 10, 30, 30);
    self.selectView.image = [UIImage imageNamed:@"iconfont-iconfontcaidan"];
    
    self.selectButton.frame = CGRectMake(235, 10, 30, 30);
    [self.selectButton setTitle:@"选集" forState:(UIControlStateNormal)];
    [self.selectButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    
    self.relationView.frame = CGRectMake(280, 10, 30, 30);
//    self.relationView.backgroundColor = [UIColor greenColor];
    self.relationView.image = [UIImage imageNamed:@"iconfont-iconfontuntitled149"];
    
    self.relationButton.frame = CGRectMake(315, 10, 30, 30);
    [self.relationButton setTitle:@"排序" forState:(UIControlStateNormal)];
    [self.relationButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
}
-(void)setAlbumIdM:(AlbumIdModel *)albumIdM{
    _albumIdM = albumIdM;
    if (albumIdM != nil) {
        self.totalSetLabel.text = [NSString stringWithFormat:@"共%ld集",albumIdM.tracks];
    }

}

@end
