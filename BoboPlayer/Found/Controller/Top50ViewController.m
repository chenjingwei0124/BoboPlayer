//
//  Top50ViewController.m
//  MyMusic
//
//  Created by sajyy on 15/10/30.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "Top50ViewController.h"
#import "DetailMusicViewController.h"
#import "NetHandler.h"
#import "DetailMusicList.h"
#import "Top50Cell.h"
#import "UIColor+AddColor.h"

@interface Top50ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation Top50ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    self.title = @"音乐榜TOP50";
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height -64) style:(UITableViewStylePlain)];
    self.tabelView.backgroundColor = [UIColor whiteColor];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tabelView];
    [self handle];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    Top50Cell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[Top50Cell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    }
    if (self.top50ListArray.count != 0) {
        cell.detailMusicList = self.top50ListArray[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.5;
    [self.view.superview.layer addAnimation:transition forKey:@"立方体效果"];
    if (self.top50ListArray.count!=0) {
        NSInteger albumId = ((DetailMusicList*)self.top50ListArray[indexPath.row]).albumId;
        DetailMusicViewController *detailMusicVC = [[DetailMusicViewController alloc]initWithId:albumId];
        detailMusicVC.view.backgroundColor = [UIColor whiteColor];
        UIView *superView = self.view.superview;
        [self.view removeFromSuperview];
        [superView addSubview:detailMusicVC.view];
        [self.navigationController pushViewController:detailMusicVC animated:YES];
    }
}


-(void)handle{
    
    self.top50ListArray = [NSMutableArray array];
    NSString *url = @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album?device=android&key=ranking%3Aalbum%3Aplayed%3A1%3A2&pageId=1&pageSize=50";
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *arry = [rootDic objectForKey:@"list"];
            for (NSDictionary *dic in arry) {
                DetailMusicList *detailMustList = [[DetailMusicList alloc]init];
                [detailMustList setValuesForKeysWithDictionary:dic];
                [self.top50ListArray addObject:detailMustList];
            }
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabelView reloadData];
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
