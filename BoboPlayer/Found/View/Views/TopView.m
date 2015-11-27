//
//  TopView.m
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "TopView.h"
#import "StoreView.h"
#import "AlbumIdModel.h"
#import "UIImageView+WebCache.h"

@interface TopView ()

@property(nonatomic,strong)UIView *lineOne;
@property(nonatomic,strong)UIView *lineTwo;
@end

@implementation TopView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.largeImageView = [[UIImageView alloc]init];
        [self addSubview:self.largeImageView];
        
        self.smallImageView = [[UIImageView alloc]init];
        [self addSubview:self.smallImageView];
        
        self.signImageView = [[UIImageView alloc]init];
        [self addSubview:self.signImageView];
        
        self.titleLabel = [[UILabel alloc]init];
        [self addSubview:self.titleLabel];
        
        self.desLabel = [[UILabel alloc]init];
        [self addSubview:self.desLabel];
        
        self.movieLabel = [[UILabel alloc]init];
        [self addSubview:self.movieLabel];
        
        self.musicLabel = [[UILabel alloc]init];
        [self addSubview:self.musicLabel];
        
        self.storeView1 = [[StoreView alloc]init];
        [self addSubview:self.storeView1];
        
        self.storeView2 = [[StoreView alloc]init];
        [self addSubview:self.storeView2];
        
        self.lineOne = [[UIView alloc]init];
        [self addSubview:self.lineOne];
        
        self.lineTwo = [[UIView alloc]init];
        [self addSubview:self.lineTwo];
        
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.largeImageView.frame = CGRectMake(20, 20, self.bounds.size.width/3.5, self.bounds.size.width/3.5);
//    self.largeImageView.backgroundColor = [UIColor grayColor];

    self.smallImageView.frame = CGRectMake(20+ self.largeImageView.frame.origin.x + self.largeImageView.bounds.size.width, 20 , self.largeImageView.bounds.size.width/3, self.largeImageView.bounds.size.height/3);
    
//    self.smallImageView.backgroundColor = [UIColor grayColor];

    self.titleLabel.frame = CGRectMake(self.smallImageView.frame.origin.x + self.smallImageView.bounds.size.width + 10,self.smallImageView.frame.origin.y,self.bounds.size.width/3 ,self.smallImageView.bounds.size.height);
//    self.titleLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];

    self.desLabel.frame = CGRectMake(self.smallImageView.frame.origin.x, self.smallImageView.frame.origin.y + self.smallImageView.bounds.size.height + 5, self.bounds.size.width/2, self.largeImageView.bounds.size.height/4);
//    self.desLabel.backgroundColor = [UIColor grayColor];
    self.desLabel.textColor = [UIColor whiteColor];
    self.desLabel.font = [UIFont systemFontOfSize:14];
    
    self.signImageView.frame = CGRectMake(self.desLabel.frame.origin.x + self.desLabel.bounds.size.width + 5, self.desLabel.frame.origin.y, self.largeImageView.bounds.size.width/4, self.largeImageView.bounds.size.width/4);
    
    self.lineOne.frame = CGRectMake(10, self.largeImageView.frame.origin.y + self.largeImageView.bounds.size.height + 10, self.bounds.size.width - 20 ,1);
    self.lineOne.backgroundColor = [UIColor whiteColor];
    
    self.storeView1.frame = CGRectMake(self.bounds.size.width/9, self.largeImageView.frame.origin.y + self.largeImageView.bounds.size.height + 20, self.bounds.size.width/3, self.largeImageView .bounds.size.height/3);

    self.storeView1.nameLabel.titleLabel.font = [UIFont systemFontOfSize:14];
    self.storeView1.pictView.image = [UIImage imageNamed:@"iconfont-collected"];
    
    self.lineTwo.frame = CGRectMake(self.bounds.size.width/2, self.lineOne.frame.origin.y + 3, 1, self.largeImageView.bounds.size.width/2 - 10);
    self.lineTwo.backgroundColor = [UIColor whiteColor];
    
    self.storeView2.frame = CGRectMake(self.storeView1.frame.origin.x + self.storeView1.bounds.size.width + self.bounds.size.width/9, self.largeImageView.frame.origin.y + self.largeImageView.bounds.size.height + 20, self.bounds.size.width/3, self.largeImageView .bounds.size.height/3);
    
    self.storeView2.nameLabel.titleLabel.font = [UIFont systemFontOfSize:14];
    self.storeView2.pictView.image = [UIImage imageNamed:@"iconfont-0038filesempty"];
}

-(void)setAlbumIdModel:(AlbumIdModel *)albumIdModel{
    _albumIdModel = albumIdModel;
    if (albumIdModel!=nil) {
        NSString *url1 = albumIdModel.coverMiddle;
        [self.largeImageView sd_setImageWithURL:[NSURL URLWithString:url1] placeholderImage:nil];
        NSString *url2 = albumIdModel.avatarPath;
        [self.smallImageView sd_setImageWithURL:[NSURL URLWithString:url2] placeholderImage:nil];
        self.smallImageView.layer.cornerRadius = self.largeImageView.bounds.size.width/6;
        self.smallImageView.layer.masksToBounds = YES;
        self.signImageView.image = [UIImage imageNamed:@"iconfont-iconnext"];
        self.titleLabel.text = albumIdModel.nickname;
        if ([albumIdModel.intro isEqualToString:@""]) {
            self.desLabel.text = @"暂无简介";
        }else{
            self.desLabel.text = albumIdModel.intro;
        }
        NSString *tags = albumIdModel.tags;
        NSArray *array = [tags componentsSeparatedByString:@","];
        if (array.count >= 2) {
            [self.storeView1.nameLabel setTitle:array[0] forState:(UIControlStateNormal)];
            [self.storeView2.nameLabel setTitle:array[1] forState:(UIControlStateNormal)];
        }else{
            [self.storeView1.nameLabel setTitle:array[0] forState:(UIControlStateNormal)];
            [self.storeView2.nameLabel setTitle:@"娱乐" forState:(UIControlStateNormal)];
        }
    }
}



@end
