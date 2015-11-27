//
//  PlayerDateil.m
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "PlayerDateil.h"
#import "SongData.h"

@interface PlayerDateil ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableV;
@end

@implementation PlayerDateil

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height)) style:(UITableViewStylePlain)];
        self.tableV.delegate = self;
        self.tableV.dataSource =self;
        self.tableV.backgroundColor = [UIColor clearColor];
        [self addSubview:self.tableV];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"@2Xiconfont-yonghu.png"];
        cell.textLabel.text = [NSString stringWithFormat:@"歌手: %@", self.songData.singerName];
    }else if (indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"@2Xiconfont-zhuanji"];
        cell.textLabel.text = [NSString stringWithFormat:@"专辑: %@", self.songData.albumName];
    }else if (indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"@2Xiconfont-yuleyinlediantai"];
        cell.textLabel.text = @"相似歌曲电台";
    }else{
        cell.imageView.image = [UIImage imageNamed:@"@2Xiconfont-iconfontttpodicon3"];
        cell.textLabel.text = @"包含此歌曲歌单";
    }
    
    return cell;
}

- (void)setSongData:(SongData *)songData{
    _songData = songData;

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
