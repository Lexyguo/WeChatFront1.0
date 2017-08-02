//
// /Users/apple/Desktop/ttest/ttest.xcodeproj SearchResultViewController.m
//  ttest
//
//  Created by lexyguo on 2017/8/1.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import "SearchResultViewController.h"
#import "TableViewCell.h"
#import "Masonry.h"
#import "User.h"
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>

@end
static NSString *cellID=@"resultTableViewCell";
@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle=NO;
    self.tableView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.95f];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cellx = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    User *u=self.searchResults[indexPath.row];

    cellx.pic.image=[UIImage imageNamed:u.head];
    cellx.user.text=u.name;
    cellx.details.text=u.chat;
    return cellx;
}
@end
