//
//  SearchAddListView.m
//  BoboPlayer
//
//  Created by lanou on 15/11/4.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SearchAddListView.h"
#import "SongDataBase.h"

@interface SearchAddListView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic ,strong)UITableView *tableV;

@property (nonatomic, strong)NSMutableArray *array;

@end

@implementation SearchAddListView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.array = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"mySongsList"]];
        
        UIView *titleV = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, 5))];
        [self addSubview:titleV];
        titleV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
        
        self.titleL = [[UILabel alloc] initWithFrame:(CGRectMake(frame.size.width/2 - 40, 15, 80, 20))];
        self.titleL.text = @"加入歌单";
        [self addSubview:self.titleL];
        
        self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(10, self.titleL.frame.size.height + self.titleL.frame.origin.y + 10, frame.size.width - 20, frame.size.height - 50 - 25 - 10)) style:(UITableViewStylePlain)];
        self.tableV.delegate = self;
        self.tableV.dataSource = self;
        self.tableV.tableFooterView = [[UIView alloc] init];
        [self addSubview:self.tableV];
        
        self.cancelB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.cancelB.frame = CGRectMake(0, frame.size.height - 50, frame.size.width, 50);
        [self.cancelB setTitle:@"取消" forState:(UIControlStateNormal)];
        [self addSubview:self.cancelB];
        [self.cancelB setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.array[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"iconfont-yinlezhuanti"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSMutableArray *arr = [NSMutableArray array];
    NSString *str = [NSString stringWithFormat:@"songOflist%@", cell.textLabel.text];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[ud objectForKey:str]];
    [arr addObject:self.songDataBase.songID];
    [ud setObject:arr forKey:str];
    [ud synchronize];
    arr = [ud objectForKey:str];
    
    NSLog(@"%@",arr);
    
    self.searchPopBlock();
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
