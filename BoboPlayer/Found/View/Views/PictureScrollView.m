//
//  PictureScrollView.m
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "PictureScrollView.h"
#import "ListFourModel.h"
#import "UIImageView+WebCache.h"


@implementation PictureScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
            for (int i = 0; i < 8; i++) {
                UIImageView *pictView = [[UIImageView alloc]init];
                pictView.tag = 1200 + i;
                pictView.userInteractionEnabled = YES;
                [self addSubview:pictView];
        }
        //设置定时器
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoPlay:) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
        for (int i = 0; i < 8; i++) {
            ((UIImageView *)[self viewWithTag:(1200+i)]).frame = CGRectMake(i*self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
            ((UIImageView *)[self viewWithTag:(1200+i)]).backgroundColor = [UIColor redColor];
        }
    
}

//实现自动滚动
-(void)autoPlay:(NSTimer*)timer{
    CGFloat width = self.bounds.size.width;
    CGPoint offSet = self.contentOffset;
    if (offSet.x + width > width * 7) {
        [self setContentOffset:(CGPointZero) animated:NO];
        [self setContentOffset:(CGPointMake(width, offSet.y)) animated:YES];
    } else {
        [self setContentOffset:(CGPointMake(offSet.x + width, offSet.y)) animated:YES];
    }
    offSet = self.contentOffset;
}

-(void)setListFourArray:(NSMutableArray *)listFourArray{
    _listFourArray = [NSMutableArray array];
    _listFourArray = listFourArray;
    if (listFourArray.count != 0) {
        for (int i = 0; i < 8; i++) {
            if (i == 7) {
                ListFourModel *listFourModel = listFourArray[0];
                NSString *url = listFourModel.pic;
                [((UIImageView *)[self viewWithTag:(1200+i)]) sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
            }else{
                ListFourModel *listFourModel = listFourArray[i];
                NSString *url = listFourModel.pic;
                [((UIImageView *)[self viewWithTag:(1200 + i)]) sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
            }
        }
    }
}

@end
