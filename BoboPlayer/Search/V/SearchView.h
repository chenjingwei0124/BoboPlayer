//
//  SearchView.h
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^searchBlock)(NSString *value);

@interface SearchView : UIView

@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic, strong)searchBlock searchBlock;

@end
