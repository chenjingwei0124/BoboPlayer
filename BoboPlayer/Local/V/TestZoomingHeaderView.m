//
//  TestZoomingHeaderView.m
//  LJWZoomiingHeaderView
//
//  Created by ljw on 15/10/2.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "TestZoomingHeaderView.h"

@implementation TestZoomingHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSUserDefaults *uf = [NSUserDefaults standardUserDefaults];
        BOOL isImageChanged = [uf boolForKey:@"isImageChanged"];
        
        if (!_imageView ) {
            if (!isImageChanged) {
            
                _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.jpg"]];
            }
            else{
            
                _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.jpg"]];
                NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"chick.png"];
                UIImage *savedImage = [[UIImage alloc]initWithContentsOfFile:fullPath];
                _imageView.image = savedImage;
            
            }
            
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
    return 450.f;
}

//header往下的偏移量，然而不是很完美，然而现在应该可以用了~。
- (CGFloat)frameOffset
{
    return 70.f;
}

- (CGFloat)frameOffsetTrainsitionRate
{
    return 0.5;
}

@end
