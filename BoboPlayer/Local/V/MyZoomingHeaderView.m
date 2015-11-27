
//
//  MyZoomingHeaderView.m
//  MPlayer
//
//  Created by SUN on 15/10/30.
//  Copyright © 2015年 孙海睿. All rights reserved.
//

#import "MyZoomingHeaderView.h"

@implementation MyZoomingHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_imageView ) {
                _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        }
        
        [self addSubview:self.imageView];
        
        
    }
    return self;
}

#pragma mark Protocol 这里都是可选的
//在这里设置子视图的frame让他们能跟着一块儿变大变小，粗粗细细，伸伸缩缩~
- (void)resetSubViewsFrame
{
    self.imageView.frame = self.bounds;
}

//header最大的高度
- (CGFloat)maxmumHeight
{
    return 400.f;
}

//header往下的偏移量，然而不是很完美，然而现在应该可以用了~。
- (CGFloat)frameOffset
{
    return 100.f;
}

- (CGFloat)frameOffsetTrainsitionRate
{
    return 0.4f;
}


@end
