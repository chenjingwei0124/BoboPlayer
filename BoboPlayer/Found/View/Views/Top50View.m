//
//  Top50View.m
//  MyMusic
//
//  Created by sajyy on 15/10/30.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "Top50View.h"
#import "UIImageView+WebCache.h"
#import "ListThreeModel.h"

@implementation Top50View
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.pictView = [[UIImageView alloc]init];
        [self addSubview:self.pictView];
        
        self.titleLabel = [[UILabel alloc]init];
        [self addSubview:self.titleLabel];
        
        self.desLabel = [[UILabel alloc]init];
        [self addSubview:self.desLabel];
        
        self.nextView = [[UIImageView alloc]init];
        [self addSubview:self.nextView];

    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.pictView.frame = CGRectMake(10,10,self.bounds.size.width/9, self.bounds.size.width/9);
    
    self.titleLabel.frame = CGRectMake(self.bounds.size.width/9 + 20, 10, self.bounds.size.width/2, self.bounds.size.height/4);

    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.desLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.bounds.size.height +10, self.bounds.size.width*3/5, self.bounds.size.height/4);
    self.desLabel.font = [UIFont systemFontOfSize:14];
    
    self.nextView.frame = CGRectMake(self.desLabel.frame.origin.x + self.desLabel.bounds.size.width + 38, 18, self.bounds.size.width/12, self.bounds.size.width/12);

    
}
-(void)setListThreeModel:(ListThreeModel *)listThreeModel{
    _listThreeModel = listThreeModel;
    if (listThreeModel != nil) {
        NSString *url = listThreeModel.coverPath;
        [self.pictView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
        self.titleLabel.text = listThreeModel.title;
        self.desLabel.text = listThreeModel.subtitle;
        self.nextView.image = [UIImage imageNamed:@"iconfont-iconnext"];
    }
}


@end
