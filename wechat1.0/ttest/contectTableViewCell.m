//
//  contectTableViewCell.m
//  ttest
//
//  Created by lexyguo on 2017/7/31.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import "contectTableViewCell.h"
#import "Masonry.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation contectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor=[UIColor whiteColor];
        [self display];
    }
    return self;
}
-(void)display{
    self.icon=[[UIImageView alloc] init];
    [self.contentView addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(9.5);
        make.left.equalTo(self.contentView).offset(10);
        make.height.mas_offset(38);
    }];
    
    self.name=[[UILabel alloc]init];
    self.name.textColor=[UIColor blackColor];
    self.name.font = [UIFont systemFontOfSize:16.0];
    [self.contentView addSubview:self.name];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo(self.contentView).offset(58);
    }];
    
    self.rname=[[UILabel alloc]init];
    self.rname.hidden=YES;
    self.rname.textColor=[UIColor blackColor];
    self.rname.font = [UIFont systemFontOfSize:16.0];
    [self.contentView addSubview:self.rname];
    [self.rname mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(11);
        make.left.equalTo(self.contentView).offset(58);
    }];
    
    self.tags=[[UILabel alloc]init];
    self.tags.hidden=YES;
    self.tags.textColor=kUIColorFromRGB(0x888888);
    self.tags.font = [UIFont systemFontOfSize:14.5];
    [self.contentView addSubview:self.tags];
    [self.tags mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_bottom).offset(5.8);
        make.left.equalTo(self.contentView).offset(58);
    }];
    
    UIImageView *line=[[UIImageView alloc]init];
    line.backgroundColor=kUIColorFromRGB(0xe1e1e1);
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(56);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}
-(void)refresh{
    self.name.hidden=YES;
    self.rname.hidden=NO;
    self.tags.hidden=NO;
}
@end
