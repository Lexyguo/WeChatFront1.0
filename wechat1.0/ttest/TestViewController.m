#import "TestViewController.h"
#import "TableViewCell.h"
#import "SearchResultViewController.h"
#import "Masonry.h"
#import "User.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TestViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) SearchResultViewController *mySRTVC;
@property (nonatomic,strong) UISearchController *svc;

@end

@implementation TestViewController
-(NSArray *)dataSource{
    if(!_dataSource){
        _dataSource=[User demoData];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle=NO;
    self.tableView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.95f];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self search];
    
}
- (void)search{
    self.mySRTVC=[[SearchResultViewController alloc] init];
    self.mySRTVC.mainSearchController = self;
    self.svc=[[UISearchController alloc] initWithSearchResultsController:self.mySRTVC];
    [self.svc.searchBar sizeToFit];
    self.tableView.tableHeaderView=self.svc.searchBar;
    
    //设置搜索控制器的结果更新代理对象
    self.svc.searchResultsUpdater=self;
    
/*    //Scope:就是效果图中那个分类选择器
    self.svc.searchBar.scopeButtonTitles=@[@"设备",@"软件",@"其他"];
    //为了响应scope改变时候，对选中的scope进行处理 需要设置search代理
    self.svc.searchBar.delegate=self;
*/
    self.definesPresentationContext=YES;
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
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID=@"WXTableViewCell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        cell=[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    User *u=self.dataSource[indexPath.row];
    cell.pic.image=[UIImage imageNamed:u.head];
    cell.user.text=u.name;
    cell.details.text=u.chat;
    return cell;
}

#pragma mark - UISearchResultsUpdating

/**实现更新代理*/
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //获取到用户输入的数据
    NSString *searchText=searchController.searchBar.text;
    NSMutableArray *searchResult=[[NSMutableArray alloc]init];
    for (User *u in self.dataSource) {
        NSRange range=[u.name rangeOfString:searchText];
        if(range.length> 0){
            [searchResult addObject:u];
        }
    }
    self.mySRTVC.searchResults=searchResult;
     
    /**通知结果ViewController进行更新*/
    [self.mySRTVC.tableView reloadData];
}

#pragma mark - UISearchBarDelegate
/**点击按钮后，进行搜索页更新*/
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.svc];
}

@end
