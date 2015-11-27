//
//  SearchDetailView.h
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^searchDetailBlock)(CGFloat y, NSInteger index);
typedef void(^seachDeBlck)(void);
@interface SearchDetailView : UIView

@property (nonatomic, strong)NSMutableArray *array;

@property (nonatomic, strong)searchDetailBlock searchDetailBlock;
@property (nonatomic, strong)seachDeBlck seachDeBlck;
@end
