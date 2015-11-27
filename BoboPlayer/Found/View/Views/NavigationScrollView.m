//
//  NavigationScrollView.m
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "NavigationScrollView.h"
#import "ListModel.h"
#import "UIColor+AddColor.h"

@implementation NavigationScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 1; i < 27; i++) {
            if(i != 26){
                UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
                button.frame = CGRectMake(15*i + (i-1)*(self.bounds.size.width - 15*5)/4, 5, (self.bounds.size.width - 15*5)/4, 30);
                button.backgroundColor = [UIColor greenColor];
                button.tintColor = [UIColor purpleColor];
                button.tag = 1000+i;
                button.layer.cornerRadius = 5;
                button.layer.shadowOffset = CGSizeMake(1, 1);
                button.layer.shadowColor = [[UIColor jinjuse] CGColor];
//                button.layer.borderColor = [[UIColor qianweise] CGColor];
//                button.layer.borderWidth = 1;
                [self addSubview:button];
                [self.navigationArray addObject:button];
            }
            else {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
                button.frame = CGRectMake(15*26 + 25*(self.bounds.size.width - 15*5)/4, 5, (self.bounds.size.width - 15*5)/2-10, 30);
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15*26 + 25*(self.bounds.size.width - 15*5)/4+button.bounds.size.width+15, 5, 110, 30)];
                label.text = @"💖 💖 💖 💖";
                [self addSubview:label];
                button.backgroundColor = [UIColor greenColor];
                button.tintColor = [UIColor purpleColor];
                button.layer.cornerRadius = 5;
                button.layer.shadowOffset = CGSizeMake(1, 1);
                button.layer.shadowColor = [[UIColor jinjuse] CGColor];
                button.layer.borderColor = [[UIColor qianweise] CGColor];
                button.layer.borderWidth = 1;
                [self addSubview:button];
                [self.navigationArray addObject:button];
                button.tag = 1000+i;
            }
        }
        self.showLabel = [[UILabel alloc]init];
        self.showLabel.frame = CGRectMake(15,37,(self.bounds.size.width-15*5)/4, 2);
        self.showLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.showLabel];
        
    }
    return self;
}

-(void)setNavigationArray:(NSMutableArray *)navigationArray{
    _navigationArray = [NSMutableArray array];
    _navigationArray = navigationArray;
}

-(void)setListArray:(NSMutableArray *)listArray{
    _listArray = [NSMutableArray array];
    _listArray = listArray;
    if (listArray.count != 0) {
        for(int i = 0;i < 26;i++){
            if (i == 0) {
                [((UIButton *)[self viewWithTag:(1000 + i+1)]) setTitle:@"推荐" forState:(UIControlStateNormal)];
            }
            else{
                self.listModel = listArray[i];
                NSString *string = [self.listModel valueForKey:@"tname"];
                [((UIButton *)[self viewWithTag:(1000 + i+1)]) setTitle:string forState:(UIControlStateNormal)];
            }
        }
    }
}

@end
