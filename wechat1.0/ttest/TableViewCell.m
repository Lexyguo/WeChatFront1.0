//
//  TableViewCell.m
//  test
//
//  Created by lexyguo on 2017/7/20.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation TableViewCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor=[UIColor whiteColor];
        [self setup];
    }
    return self;
}


-(void)setup{
    //头像
    _pic=[[UIImageView alloc] init];
    _pic.backgroundColor=[UIColor clearColor];
    _pic.layer.cornerRadius=5;
    _pic.layer.masksToBounds=YES;
    [self.contentView addSubview:_pic];
    [_pic mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(8);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_offset(53);
        make.height.mas_offset(53);
    }];
    
    UIImageView *line=[[UIImageView alloc]init];
    line.backgroundColor=kUIColorFromRGB(0xe1e1e1);
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(70);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
    //用户
    _user=[[UILabel alloc] init];
    _user.text=@"lexy";
    _user.textColor=[UIColor blackColor];
    _user.font = [UIFont systemFontOfSize:16.0];
    [self.contentView addSubview: _user];
    [_user mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_pic).offset(5);
        make.left.equalTo(_pic.mas_right).offset(10);
    }];
    
    //详细
    _details=[[UILabel alloc] init];
    _details.text=@"你好呀";
    _details.textColor=[[UIColor blackColor] colorWithAlphaComponent:0.70f];
    _details.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview: _details];
    [_details mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(_pic).offset(-5);
        make.left.equalTo(_pic.mas_right).offset(10);
    }];
    
    //时间
    _time=[[UILabel alloc] init];
    _time.text=@"上午10:00";
    _time.textColor=[[UIColor blackColor] colorWithAlphaComponent:0.70f];
    _time.font = [UIFont systemFontOfSize:12.0];
    [self.contentView addSubview: _time];
    [_time mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_pic).offset(2);
        make.right.equalTo(self.contentView).offset(-5);
    }];
}
@end
