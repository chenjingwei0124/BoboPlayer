//
//  PopHideView.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^popHidBlock)(void);
@interface PopHideView : UIView
@property (nonatomic, copy)popHidBlock popHidBlock;


@end
