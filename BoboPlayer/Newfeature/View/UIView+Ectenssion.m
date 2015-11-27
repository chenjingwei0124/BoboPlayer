//
//  UIView+Ectenssion.m
//  BoboPlayer
//
//  Created by 葛宏兵 on 15/11/14.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "UIView+Ectenssion.h"

@implementation UIView (Ectenssion)

-(void)setCenterX:(CGFloat )centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
-(CGFloat)centerX
{
    return self.center.x;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(CGFloat)centerY
{
    return self.center.y;
}
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
-(CGSize)size
{
    return self.frame.size;
}
-(void)setOrgin:(CGPoint)orgin
{
    CGRect frame = self.frame;
    frame.origin = orgin;
    self.frame = frame;
}
-(CGPoint)orgin
{
    return self.frame.origin;
}

@end
