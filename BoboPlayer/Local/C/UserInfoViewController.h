//
//  UserInfoViewController.h
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef void (^reload)(void);

@interface UserInfoViewController : UIViewController

@property (nonatomic, strong)UIView *headV;
@property (nonatomic, strong)UIButton *backB;
@property (nonatomic, strong)UIButton *searchB;
@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, copy) reload reload;

@end
