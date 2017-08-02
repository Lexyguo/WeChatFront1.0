//
//  contectTableViewCell.h
//  ttest
//
//  Created by lexyguo on 2017/7/31.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contectTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *rname;
@property (nonatomic,strong) UILabel *tags;
-(void)refresh;
@end
