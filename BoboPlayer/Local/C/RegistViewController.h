//
//  RegistViewController.h
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^regist)(NSString *showText);


@interface RegistViewController : UIViewController
@property (nonatomic, strong)UIView *headV;
@property (nonatomic, strong)UIButton *leftB;
@property (nonatomic, strong)UIButton *rightB;
@property (nonatomic, copy) regist regist;
@end
