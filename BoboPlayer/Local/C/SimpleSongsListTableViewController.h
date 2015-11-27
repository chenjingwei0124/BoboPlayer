//
//  SimpleSongsListTableViewController.h
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
//我的歌单
@interface SimpleSongsListTableViewController :BaseViewController
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *array;
@end
