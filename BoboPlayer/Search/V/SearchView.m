//
//  SearchView.m
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SearchView.h"

@interface SearchView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableV;
@end

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
        self.tableV.delegate = self;
        self.tableV.dataSource = self;
        [self addSubview:self.tableV];
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
    return cell;
}

- (void)setArray:(NSMutableArray *)array{
    _array = array;
    [self.tableV reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.searchBlock(self.array[indexPath.row]);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
