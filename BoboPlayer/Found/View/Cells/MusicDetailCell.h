//
//  MusicDetailCell.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class listTwoModel;
@interface MusicDetailCell : UITableViewCell
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)listTwoModel *listTwoM;
@property (nonatomic,strong)NSMutableArray *listThreeTArray;
@end
