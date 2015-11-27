//
//  NavigationScrollView.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListModel;
@interface NavigationScrollView : UIScrollView
@property (nonatomic,strong)NSMutableArray *navigationArray;
@property (nonatomic,strong)UILabel *showLabel;
@property (nonatomic,strong)NSMutableArray *listArray;
@property (nonatomic,strong)ListModel *listModel;
@end
