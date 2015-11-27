//
//  OnlyActivityViewController.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnlyActivity.h"

#import "BaseViewController.h"
@interface OnlyActivityViewController : BaseViewController

@property(nonatomic,strong)OnlyActivity *activity;
@property(nonatomic,strong)NSString *webUrl;
@end
