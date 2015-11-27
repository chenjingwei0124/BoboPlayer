//
//  DetailButtonViewController.h
//  MyMusic
//
//  Created by sajyy on 15/11/2.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class ListModel;
@interface DetailButtonViewController : BaseViewController
@property(nonatomic,strong)ListModel *listModel;
@property(nonatomic,strong)NSString *nameString;
@property(nonatomic,strong)NSMutableArray *listArray;
@property(nonatomic,strong)UITableView *tableView;

-(instancetype)initWithModel:(ListModel*)listModel;
@end
