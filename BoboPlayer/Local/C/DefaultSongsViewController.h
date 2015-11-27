//
//  DefaultSongsViewController.h
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "BaseViewController.h"

@interface DefaultSongsViewController : BaseViewController
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;

@property (nonatomic, assign) BOOL isCollect;
@end
