//
//  SearchViewController.m
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SearchViewController.h"
#import "NetHandler.h"
#import "SearchView.h"
#import "SongDataBase.h"
#import "SearchDetailView.h"
#import "SearchAddListView.h"
#import "SearchPopView.h"

@interface SearchViewController ()<UISearchBarDelegate>

@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic, strong)SearchView *searchV;
@property (nonatomic, strong)SearchDetailView *searchDetilV;

@property (nonatomic, strong)SearchAddListView *searchAddV;
@property (nonatomic, strong)SearchPopView *searchPopV;

@property (nonatomic, strong)UIView *rightV;
@property (nonatomic, strong)UIButton *collectB;
@property (nonatomic, strong)UIButton *addListB;
@property (nonatomic, strong)UIButton *playerB;
@property (nonatomic, assign)NSInteger index;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.rightV = [[UIView alloc] init];
    self.rightV.alpha = 0.9;
    self.rightV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
    [self.view addSubview:self.rightV];
    self.rightV.hidden = YES;
    
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:(CGRectMake(self.backB.frame.origin.x + self.backB.bounds.size.width + 20, self.headV.bounds.size.height/2 - 5, self.view.bounds.size.width -2 * (self.backB.frame.origin.x + self.backB.bounds.size.width + 20) , 30))];
    self.searchBar.placeholder = @"输入要搜索的歌名:";
    self.searchBar.delegate = self;
    self.searchBar.barStyle = UIBarMetricsDefault;
    self.searchBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.searchBar];
    
    __weak typeof(self)blockSelf = self;
    
    self.searchV = [[SearchView alloc] initWithFrame:(CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 * 2))];
    [self.view addSubview:self.searchV];
    self.searchV.hidden = YES;
    self.searchV.searchBlock = ^(NSString *value){
        blockSelf.searchBar.text = value;
        [blockSelf searchBAction:blockSelf.searchB];
    };
    
    
    self.searchDetilV = [[SearchDetailView alloc] initWithFrame:(CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 * 2))];
    [self.view addSubview:self.searchDetilV];
    self.searchDetilV.hidden = YES;
    
    self.searchDetilV.searchDetailBlock = ^(CGFloat y, NSInteger index){
        SongDataBase *songDataBase = blockSelf.array[index];
        if (songDataBase.auditionList.count == 0) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"以为版本问题,此歌曲不能播放" preferredStyle:(UIAlertControllerStyleAlert)];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [blockSelf presentViewController:alertVC animated:YES completion:nil];
            return ;
        }
        blockSelf.rightV.hidden = NO;
        if (blockSelf.index == index) {
            if (blockSelf.rightV.frame.origin.x == blockSelf.view.bounds.size.width/2) {
                [UIView animateWithDuration:0.3 animations:^{
                    blockSelf.rightV.frame = CGRectMake(blockSelf.view.bounds.size.width, y + 65, blockSelf.view.bounds.size.width/2, 65);
                }];
            }else{
                blockSelf.rightV.frame = CGRectMake(blockSelf.view.bounds.size.width, y + 65, self.view.bounds.size.width/2, 65);
                [UIView animateWithDuration:0.3 animations:^{
                    blockSelf.rightV.frame = CGRectMake(blockSelf.view.bounds.size.width/2, y + 65, blockSelf.view.bounds.size.width/2, 65);
                }];
            }
        }else{
            blockSelf.rightV.frame = CGRectMake(blockSelf.view.bounds.size.width, y + 65, self.view.bounds.size.width/2, 65);
            [UIView animateWithDuration:0.3 animations:^{
                blockSelf.rightV.frame = CGRectMake(blockSelf.view.bounds.size.width/2, y + 65, blockSelf.view.bounds.size.width/2, 65);
            }];
        }
        [blockSelf addRightView];
        blockSelf.index = index;
    };
    self.searchDetilV.seachDeBlck = ^(void){
        if (blockSelf.rightV.frame.origin.x == blockSelf.view.bounds.size.width/2) {
            [UIView animateWithDuration:0.1 animations:^{
                blockSelf.rightV.frame = CGRectMake(blockSelf.view.bounds.size.width, blockSelf.rightV.frame.origin.y, blockSelf.view.bounds.size.width/2, 65);
            }];
        }
    };
    [self.view bringSubviewToFront:self.rightV];
    
    [self.searchB addTarget:self action:@selector(searchBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.searchPopV = [[SearchPopView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))];
    self.searchPopV.backgroundColor = [UIColor blackColor];
    self.searchPopV.alpha = 0.5;
    [self.view addSubview:self.searchPopV];
    self.searchPopV.hidden = YES;
    self.searchPopV.searchPopBlock = ^(void){
        if (blockSelf.searchAddV.hidden == YES) {
            blockSelf.searchAddV.hidden = NO;
            blockSelf.searchPopV.hidden = NO;
        }else{
            blockSelf.searchAddV.hidden = YES;
            blockSelf.searchPopV.hidden = YES;
        }
    };
    
    self.searchAddV = [[SearchAddListView alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/6, self.view.bounds.size.height/4, self.view.bounds.size.width*4/6, self.view.bounds.size.height/3))];
    [self.view addSubview:self.searchAddV];
    self.searchAddV.backgroundColor = [UIColor whiteColor];
    [self.searchAddV.cancelB addTarget:self action:@selector(searchAddcancelB:) forControlEvents:(UIControlEventTouchUpInside)];
    self.searchAddV.hidden = YES;
    
    
    
    
    //==================================
    
    self.searchAddV.searchPopBlock = ^(void){
        if (blockSelf.searchAddV.hidden == YES) {
            blockSelf.searchAddV.hidden = NO;
            blockSelf.searchPopV.hidden = NO;
        }else{
            blockSelf.searchAddV.hidden = YES;
            blockSelf.searchPopV.hidden = YES;
        }
    };

    
    
    
}

- (void)searchAddcancelB:(UIButton *)button{
    if (self.searchAddV.hidden == YES) {
        self.searchAddV.hidden = NO;
        self.searchPopV.hidden = NO;
    }else{
        self.searchAddV.hidden = YES;
        self.searchPopV.hidden = YES;
    }
}

- (void)addRightView{
//    self.collectB = [UIButton buttonWithType:(UIButtonTypeSystem)];
//    self.collectB.frame = CGRectMake(self.rightV.bounds.size.width/15, 10, 65 - 20, 65 - 20);
//    [self.collectB setBackgroundImage:[UIImage imageNamed:@"iconfont-shoucangweishoucang"] forState:(UIControlStateNormal)];
//    [self.rightV addSubview:self.collectB];
    
    self.addListB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.addListB.frame = CGRectMake(self.rightV.bounds.size.width/5, 0, 42, 42);
    [self.addListB setBackgroundImage:[UIImage imageNamed:@"iconfont-jiarugedan"] forState:(UIControlStateNormal)];
    [self.rightV addSubview:self.addListB];
    
    self.playerB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.playerB.frame = CGRectMake(self.rightV.bounds.size.width*3/5, 0, 36, 36);
    [self.playerB setBackgroundImage:[UIImage imageNamed:@"iconfont-bofang1"] forState:(UIControlStateNormal)];
    [self.rightV addSubview:self.playerB];
    
//    self.collectB.center = CGPointMake(self.collectB.center.x, self.rightV.bounds.size.height/2);
    self.addListB.center = CGPointMake(self.addListB.center.x, self.rightV.bounds.size.height/2);
    self.playerB.center = CGPointMake(self.playerB.center.x, self.rightV.bounds.size.height/2);
//    [self.collectB addTarget:self action:@selector(collectBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.addListB addTarget:self action:@selector(addListBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.playerB addTarget:self action:@selector(playerBAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

//- (void)collectBAction:(UIButton *)button{
//    NSLog(@"collect1");
//}
- (void)addListBAction:(UIButton *)button{
    if (self.searchAddV.hidden == YES) {
        self.searchAddV.hidden = NO;
        self.searchPopV.hidden = NO;
        self.searchAddV.songDataBase = self.array[self.index];
        
    }else{
        self.searchAddV.hidden = YES;
        self.searchPopV.hidden = YES;
    }
}
- (void)playerBAction:(UIButton *)button{
    NSLog(@"collect3");
    SongDataBase *songDataBase = self.array[self.index];
//    NSLog(@"%@", songDataBase.songAddress);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playSongData" object:songDataBase];
}

- (void)searchBAction:(UIButton *)button{
    if (self.rightV.frame.origin.x == self.view.bounds.size.width/2) {
        [UIView animateWithDuration:0.1 animations:^{
            self.rightV.frame = CGRectMake(self.view.bounds.size.width, self.rightV.frame.origin.y, self.view.bounds.size.width/2, 65);
        }];
    }
    if ([self.searchBar.text isEqualToString:@""]) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入内容" preferredStyle:(UIAlertControllerStyleAlert)];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    [self searchDetailForValue:self.searchBar.text];
    [self.searchBar resignFirstResponder];

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (self.rightV.frame.origin.x == self.view.bounds.size.width/2) {
        [UIView animateWithDuration:0.1 animations:^{
            self.rightV.frame = CGRectMake(self.view.bounds.size.width, self.rightV.frame.origin.y, self.view.bounds.size.width/2, 65);
        }];
    }

    if ([self.searchBar.text isEqualToString:@""]) {
        [self.searchBar resignFirstResponder];
        return;
    }
    [self searchHandelForValue:searchText];
    
}

- (void)searchHandelForValue:(NSString *)value{
    self.array = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://so.ard.iyyin.com/sug/sugAll?q=%@&app=ttpod&v=v8.0.1.2015091618&uid=&mid=&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13014346888798&longtitude=121.2839832453739", value] completion:^(NSData *data) {
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSDictionary *dic2 = [dic1 objectForKey:@"data"];
            NSArray *arr1 = [dic2 objectForKey:@"keyword"];
            for (NSDictionary *dic3 in arr1) {
                
                NSString *val = [dic3 objectForKey:@"val"];
                [self.array addObject:val];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.searchDetilV.hidden = YES;
                self.searchV.hidden = NO;
                self.searchV.array = self.array;
            });
        });
    }];
}

- (void)searchDetailForValue:(NSString *)value{
    self.array = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/misc/search/song?q=%@&page=1&size=50&app=ttpod&v=v8.0.1.2015091618&uid=&mid=&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13014346888798&longtitude=121.2839832453739", value] completion:^(NSData *data) {
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *arr1 = [dic1 objectForKey:@"data"];
            for (NSDictionary *dic2 in arr1) {
                SongDataBase *songDataBase = [[SongDataBase alloc] init];
                [songDataBase setValuesForKeysWithDictionary:dic2];
                [self.array addObject:songDataBase];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.searchV.hidden = YES;
                self.searchDetilV.hidden = NO;
                self.searchDetilV.array = self.array;
            });
        });
    }];
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
