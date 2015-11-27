//
//  MainPopHidView.h
//  ChoicePlayer
//
//  Created by lanou on 15/10/27.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^popHidBlock)(void);

@interface MainPopHidView : UIView

@property (nonatomic, copy)popHidBlock popHidBlock;
@end
