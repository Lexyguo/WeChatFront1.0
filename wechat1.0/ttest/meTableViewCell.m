//
//  meTableViewCell.m
//  ttest
//
//  Created by lexyguo on 2017/7/27.
//  Copyright © 2017年 lexyguo. All rights reserved.
//
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#import "meTableViewCell.h"
#import "Masonry.h"
@implementation meTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor=[UIColor whiteColor];
        [self setup];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setup{
    UIImageView *left=[[UIImageView alloc] init];
    CALayer * layer = [left layer];
    layer.borderColor=[kUIColorFromRGB(0xd8d8d8) CGColor];
    layer.borderWidth=0.5;
    layer.cornerRadius=5;
    left.image=[UIImage imageNamed:@"myhead.png"];//self.icon;
    [self.contentView addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(11.5);
        make.left.equalTo(self.contentView).offset(14);
        make.height.width.mas_offset(67);
    }];
    
    UILabel *tl=[[UILabel alloc]init];
    tl.text=@"lexy";
    tl.textColor=[UIColor blackColor];
    tl.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:tl];
    [tl mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(left).offset(8);
        make.left.equalTo(left.mas_right).offset(20);
    }];
    
    UILabel *num=[[UILabel alloc]init];
    num.text=@"微信号：a1241963177";
    num.textColor=[UIColor blackColor];
    num.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:num];
    [num mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(left).offset(-10);
        make.left.equalTo(left.mas_right).offset(20);
    }];
    
}
@end
