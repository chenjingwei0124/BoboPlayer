//
//  MainPopListView.m
//  ChoicePlayer
//
//  Created by lanou on 15/10/27.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MainPopListView.h"
#import "UIColor+AddColor.h"
#import "SongData.h"

@interface MainPopListView ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UILabel *titleL;

@property (nonatomic, strong)UITableView *tableV;

@property (nonatomic, strong)SongData *songData;
@end

@implementation MainPopListView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleL = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, 60))];
        self.titleL.font = [UIFont systemFontOfSize:16 weight:0.5];
        self.titleL.textAlignment = NSTextAlignmentCenter;
        self.titleL.text = @"播放列表";
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.backgroundColor = [UIColor blackColor];
        [self addSubview:self.titleL];
        
        self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(0, self.titleL.bounds.size.height, frame.size.width, frame.size.height - 124)) style:(UITableViewStylePlain)];
        self.tableV.delegate = self;
        self.tableV.dataSource = self;
        self.tableV.backgroundColor = [UIColor blackColor];
        [self addSubview:self.tableV];
        
        self.lowB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.lowB.frame = CGRectMake(0, self.tableV.bounds.size.height + self.tableV.frame.origin.y, frame.size.width, 64);
        [self.lowB setTitle:@"关闭" forState:(UIControlStateNormal)];
        [self.lowB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.lowB.backgroundColor = [UIColor blackColor];
        [self addSubview:self.lowB];
        
        self.tableV.alpha = 0.7;
        self.titleL.alpha = 0.8;
        self.lowB.alpha = 0.8;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifier];
    }
    SongData *songData = self.array[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@", songData.songName, songData.singerName];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15 weight:0.3];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.popListBlock(indexPath.row);
}

- (void)setArray:(NSArray *)array{
    _array = array;
    [self.tableV reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
