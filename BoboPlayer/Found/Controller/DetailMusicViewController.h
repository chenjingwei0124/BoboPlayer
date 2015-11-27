//
//  DetailMusicViewController.h
//  MyMusic
//
//  Created by sajyy on 15/11/2.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface DetailMusicViewController : BaseViewController
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)NSInteger albumId;
-(instancetype)initWithId:(NSInteger)albumId;

@end
