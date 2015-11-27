//
//  GroupDetailCell.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class listTwoModel;
@class ListThreeTModel;
@interface GroupDetailCell : UITableViewCell
@property (nonatomic,strong)UIImageView *pictView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *describeLabel;
@property (nonatomic,strong)UILabel *musicNumLabel;
@property (nonatomic,strong)UILabel *playCountsLabel;
@property (nonatomic,strong)UIImageView *nextSign;
@property (nonatomic,strong)UIImageView *imageV1;
@property (nonatomic,strong)UIImageView *imageV2;
@property (nonatomic,strong)NSMutableArray *listTwoArray;
@property (nonatomic,strong)ListThreeTModel *listThreeTModel;
@property (nonatomic,strong)listTwoModel *listTwoM;
@end
