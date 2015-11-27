//
//  MVTableViewCell.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MVTableViewCell.h"
#import "MV.h"
#import "UIImageView+WebCache.h"

@interface MVTableViewCell ()

@property (nonatomic, retain) UILabel *dayLabel;
@property (nonatomic, retain) UILabel *mouthLabel;
@property (nonatomic, retain) UILabel *infoLabel;
@property(nonatomic,retain) UIImageView *singerImageView;


@property(nonatomic,retain) UIImageView *hengImageView;
@property(nonatomic,retain) UIImageView *playImageView;


@end

@implementation MVTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.dayLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.dayLabel];
        
        self.hengImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.hengImageView];
        
        self.mouthLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.mouthLabel];
        
        self.infoLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.infoLabel];
        
        
        self.singerImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.singerImageView];
        
        self.playImageView = [[UIImageView alloc]init];
        [self.singerImageView addSubview:self.playImageView];
        
    }
    return self;

}

-(void)setMv:(MV *)mv{

    _mv = mv;
    
    
    self.infoLabel.text = mv.desc;
    NSArray *array = [mv.title componentsSeparatedByString:@"/"];
    self.dayLabel.text = array[0];
    self.mouthLabel.text = array[1];

    [self.singerImageView sd_setImageWithURL:[NSURL URLWithString:mv.bigPicUrl]];
    
    
    
}
-(void)layoutSubviews{

    [super layoutSubviews];
    self.dayLabel.frame = CGRectMake(self.contentView.frame.size.width / 25, self.contentView.frame.size.height / 30, self.contentView.frame.size.width / 8, self.contentView.frame.size.width / 13) ;
//    self.dayLabel.backgroundColor = [UIColor redColor];
//    self.dayLabel.text = @"01";
    
    
    self.dayLabel.font = [UIFont systemFontOfSize:30 weight:0];
    self.dayLabel.textColor = [UIColor colorWithRed:0x36/255.f green:0xab/255.f blue:0x60/255.f alpha:1];
    self.dayLabel.textAlignment = YES;
    
    
    self.hengImageView.frame = CGRectMake(self.dayLabel.frame.origin.x - self.contentView.frame.size.width / 10 + self.dayLabel.frame.size.width / 2, self.dayLabel.frame.origin.y + 5, self.contentView.frame.size.width / 5, self.dayLabel.frame.size.width);
    self.hengImageView.image = [UIImage imageNamed:@"iconfont-shuxian"];
    
    
    self.mouthLabel.frame = CGRectMake(self.dayLabel.frame.origin.x, self.dayLabel.frame.origin.y + self.dayLabel.frame.size.height - 3, self.dayLabel.frame.size.width, self.dayLabel.frame.size.height);
//    self.mouthLabel.text = @"11";
    self.mouthLabel.font = [UIFont systemFontOfSize:18 weight:0];
    self.mouthLabel.textColor = [UIColor grayColor];
    self.mouthLabel.textAlignment = YES;
    
    self.infoLabel.frame = CGRectMake(self.dayLabel.frame.origin.x + self.dayLabel.frame.size.width + 5, self.dayLabel.frame.origin.y, self.contentView.frame.size.width / 8 * 6, self.window.frame.size.width * 0.15);
//    self.infoLabel.backgroundColor = [UIColor redColor];
    self.infoLabel.textColor = [UIColor grayColor];
    self.infoLabel.numberOfLines = 0;
    
    self.singerImageView.frame = CGRectMake(self.dayLabel.frame.origin.x, self.infoLabel.frame.origin.y + self.infoLabel.frame.size.height + 5 , self.contentView.frame.size.width - self.dayLabel.frame.origin.x * 2, self.contentView.frame.size.width * 0.56) ;
//    self.singerImageView.backgroundColor = [UIColor redColor];
    
    self.playImageView.frame = CGRectMake(self.singerImageView.frame.size.width / 2 - self.singerImageView.frame.size.height / 6 , self.singerImageView.frame.size.height / 2 - self.singerImageView.frame.size.height / 6, self.singerImageView.frame.size.height / 3, self.singerImageView.frame.size.height / 3);
    self.playImageView.alpha = 0.7;
    self.playImageView.image = [UIImage imageNamed:@"iconfont-bofanganniu"];
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
