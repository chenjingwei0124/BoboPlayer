//
//  MainPopListView.h
//  ChoicePlayer
//
//  Created by lanou on 15/10/27.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^mainPopListBlock)(NSInteger index);

@interface MainPopListView : UIView
@property (nonatomic, strong)UIButton *lowB;
@property (nonatomic, copy) mainPopListBlock popListBlock;

@property (nonatomic, strong)NSArray *array;
@end
