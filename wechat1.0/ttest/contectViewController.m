//
//  contectViewController.m
//  ttest
//
//  Created by lexyguo on 2017/7/28.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import "contectViewController.h"
#import "contectTableViewCell.h"
#import "Masonry.h"
@interface contectViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UISearchDisplayController *display;
@property (nonatomic,strong) NSArray *itemarr;
@property (nonatomic,strong) NSArray *contect;/**数据源*/
@property (nonatomic,strong) NSArray *titlearr;
@property (nonatomic,strong) NSArray *iconarray;
@property (nonatomic,strong) NSArray *searcharr;/**经过搜索之后的数据源*/
@end

static NSString *cellIdentifier=@"cell";
@implementation contectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.sectionIndexColor=[UIColor grayColor];
    self.tableView.sectionIndexBackgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.0f];
    self.tableView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.95f];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.searchBar setShowsScopeBar:NO];
    [self search];
    //[self filterContentenForSearchText:@"" scope:-1];
    
    self.titlearr=[[NSArray alloc]initWithObjects:@"",@"A",@"B",@"C",nil];
    
    self.itemarr=@[@[@"新的朋友",@"群聊",@"标签",@"公众号"],
                   @[@"Anita",@"Andy",@"Anna",@"Anhalt"],
                   @[@"Bob",@"Beyel",@"Ballack",@"Boaden"],
                   @[@"Cindy",@"Cendre"]];
    self.contect=@[@"Anita",@"Andy",@"Anna",@"Anhalt",@"Bob",@"Beyel",@"Ballack",@"Boaden",@"Cindy",@"Cendre"];
    self.iconarray=[[NSArray alloc]initWithObjects:@"newfriends.png",@"groupchat.png",@"label.png",@"public.png", nil];
    
    [self.tableView registerClass:[contectTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}
-(void)search{
    self.searchBar=[[UISearchBar alloc] init];
    self.searchBar.placeholder=@"Search";
    self.tableView.tableHeaderView = self.searchBar;
    
    self.display=[[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    
    self.searchBar.delegate=self;
    self.display.searchResultsDataSource=self;
    self.display.searchResultsDelegate=self;
    self.display.delegate=self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     if(tableView==self.display.searchResultsTableView){
         return 1;
     }
     return [self.titlearr count];
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if(tableView==self.display.searchResultsTableView){
         return self.searcharr.count;
     }
     return [[self.itemarr objectAtIndex:section] count];
 }

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0){
        return -35;
    }
    return 22;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56.5;
}
 -(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
     
     return [self.titlearr objectAtIndex:section];
 }


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

 //从缓存队列中取出复用的cell
     contectTableViewCell *cell=(contectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     if(cell==nil){
         cell=[[contectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
         cell.accessoryType=UITableViewCellAccessoryNone;
     }
     
     if(tableView==self.display.searchResultsTableView){
         tableView.backgroundColor=[UIColor colorWithWhite:255/255.0 alpha:0.9f];
         [cell.name setText:[NSString stringWithFormat:@"%@",self.searcharr[indexPath.row]]];
     }else{
         [[cell name] setText:[[self.itemarr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
         if(indexPath.section==0){
             cell.icon.image=[UIImage imageNamed:[self.iconarray objectAtIndex:indexPath.row]];
         }
         else{
             cell.icon.image=[UIImage imageNamed:@"head3.png"];
         }
         cell.selectionStyle=UITableViewCellSelectionStyleNone;//选中时无效果
        
     }
     return cell;
 }


 //添加索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
 
     return self.titlearr;
 
 }
 
-(NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSInteger count=0;
    for(NSString *character in self.titlearr){
        if([[character uppercaseString] hasPrefix:title]){
            return count;
        }
        count++;
    }
    return 0;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(nullable NSString *)searchString{

    NSPredicate *resultPredicate=[NSPredicate predicateWithFormat:@"self contains[cd] %@",searchString];
    self.searcharr=[self.contect filteredArrayUsingPredicate:resultPredicate];
    return YES;
}
@end
