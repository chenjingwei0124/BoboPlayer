//
//  MVViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MVViewController.h"
#import "MVTableView.h"
#import "NetHandler.h"
#import "MVPlayerViewController.h"
#import "MVTableViewCell.h"
#import "MV.h"
#import "MVList.h"
#import "MJRefresh.h"
#import "MJRefreshFooterView.h"



@interface MVViewController ()<UIWebViewDelegate,UITableViewDelegate>
//{
//
//    NSUInteger *_page;
//
//}
@property(nonatomic,retain) NSMutableArray *array;
//MVTableView *mvTV
@property(nonatomic,retain) MVTableView *mvTV;
@property(assign)NSUInteger page;
@end

@implementation MVViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.array = [NSMutableArray array];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"musicPlayerShow" object:@"NO"];
    self.mvTV = [[MVTableView alloc]initWithFrame:(CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height - 65 )) style:(UITableViewStylePlain)];
    
    self.mvTV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mvTV];
    self.mvTV.delegate = self;

    
    [self handle];

//    [self.mvTV addObserver:self forKeyPath:@"contentOffset" options:(NSKeyValueObservingOptionNew) context:nil];
    
    
//    [self foot];
    
    
    
    [self.mvTV addFooterWithTarget:self action:@selector(footerRereshing)];
    
    
//    self.mvTV.
//    footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            
//            [self.tableV.footer endRefreshing];
//        });
//    }];
//    
}

- (void)backBAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"musicPlayerShow" object:@"YES"];
}

//- (void)foot
//{
//    self.mvTV.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
//        self.page ++;
//        NSLog(@"1");
//        [self handle];
//        [self.mvTV.footer endRefreshing];
//    }];
//    
//}

-(void)footerRereshing{

    self.page ++;
    [self handle];
    [self.mvTV footerEndRefreshing];


}


//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//
//
//    if ([keyPath isEqual:@"contentOffset"]) {
//        if (self.mvTV.contentOffset.y != 0 && self.mvTV.contentOffset.y > self.view.bounds.size.width / 100 * 77 * self.array.count - self.mvTV.frame.size.height + 20) {
//
//
//                
//                _page = _page + 1;
//                [self handle];
//                NSLog(@"%lf",self.mvTV.contentOffset.y);
//                [self.mvTV reloadData];
//
//            
////            NSLog(@"yes");
//            
//        
//
//        
//        }
//    }
//
//
//
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    MVPlayerViewController *MVPlayerVC = [[MVPlayerViewController alloc]init];
    MVPlayerVC.mv = self.mvTV.array[indexPath.row];

    
    
    if (MVPlayerVC.mv.mvlist.url == nil) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"由于版权原因,该MV不能播放" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else{
    
        
        [self.navigationController pushViewController:MVPlayerVC animated:YES];

    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.view.bounds.size.width / 100 * 77 ;

}
-(void)handle{
    

    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/channel/channel/mvs?page=%ld&size=5&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2",_page] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
            NSArray *arr = [dic objectForKey:@"data"];
            for (NSDictionary *dd in arr) {
                MV *mv = [[MV alloc]init];
                [mv setValuesForKeysWithDictionary:dd];
                [self.array addObject:mv];

            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.mvTV.array = self.array;
                [self.mvTV reloadData];
                
                
            });
            
        });
        
    }];


    
//    self.array = [NSMutableArray array];
//    [NetHandler getDataWithUrl:@"http://api.dongting.com/channel/channel/mvs?page=1&size=5&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2" completion:^(NSData *data) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        
//
//            NSArray *arr = [dic objectForKey:@"data"];
//            for (NSDictionary *dd in arr) {
//                MV *mv = [[MV alloc]init];
//                [mv setValuesForKeysWithDictionary:dd];
//                [self.array addObject:mv];
//                
//            }
//
//                
//                self.mvTV.array = self.array;
//
//        
//    }];
//    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
