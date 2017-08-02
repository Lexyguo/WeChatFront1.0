//
//  SearchResultViewController.h
//  ttest
//
//  Created by lexyguo on 2017/8/1.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController
@property (strong,nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSArray *searchResults;

//在SearchResultViewController添加一个指向展示页的【弱】引用属性。
@property (nonatomic, weak) UIViewController *mainSearchController;
@end
