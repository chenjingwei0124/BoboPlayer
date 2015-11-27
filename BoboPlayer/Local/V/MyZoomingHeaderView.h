//
//  MyZoomingHeaderView.h
//  MPlayer
//
//  Created by SUN on 15/10/30.
//  Copyright © 2015年 孙海睿. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJWZoomingHeaderViewProtocol.h"

@interface MyZoomingHeaderView : UIView

//用来存放初始位置、大小，的属性，必须有，其实本来也可以不必须，懒得改了~
@property (nonatomic, assign) CGRect originFrame;

//随你怎么搞了~

@property (nonatomic, strong) UIImageView *imageView;


@end
