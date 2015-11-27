//
//  Top50View.h
//  MyMusic
//
//  Created by sajyy on 15/10/30.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListThreeModel;
@interface Top50View : UIView
@property(nonatomic,strong)UIImageView *pictView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *desLabel;
@property(nonatomic,strong)UIImageView *nextView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)ListThreeModel *listThreeModel;
@end
