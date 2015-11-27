//
//  Top50ViewController.h
//  MyMusic
//
//  Created by sajyy on 15/10/30.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface Top50ViewController : BaseViewController
@property(nonatomic,strong)UITableView *tabelView;
@property(nonatomic,strong)NSMutableArray *top50ListArray;
@end
