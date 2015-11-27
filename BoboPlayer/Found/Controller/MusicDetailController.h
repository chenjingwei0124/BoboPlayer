//
//  MusicDetailController.h
//  MyMusic
//
//  Created by sajyy on 15/10/30.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class listTwoModel;
@interface MusicDetailController : BaseViewController
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *listArray;
@property (nonatomic,strong)listTwoModel *listTwoM;
-(instancetype)initWithListTwoModel:(listTwoModel*)listTwoM;
@end
