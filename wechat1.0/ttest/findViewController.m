#import "pageItemTableViewCell.h"
#import "Masonry.h"
#import "findViewController.h"

@interface findViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *item;
@property (nonatomic,strong) NSArray *icon;
@end

@implementation findViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.separatorStyle=NO;
    self.tableView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.95f];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    self.item=@[@[@"朋友圈"],@[@"扫一扫",@"摇一摇"],@[@"附近的人",@"漂流瓶"],@[@"购物",@"游戏"],@[@"小程序"]];
    self.icon=@[@[@"moments.png"],@[@"scan qr code.png",@"snake.png"],
                @[@"people nearby.png",@"message in a bottle.png"],@[@"shopping.png",@"games.png"]
                ,@[@"miniprograms.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.item count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.item objectAtIndex:section] count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier=@"cell";
    //从缓存队列中取出复用的cell
    pageItemTableViewCell *cell=(pageItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[pageItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    [[cell item] setText:[[self.item objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    cell.icon.image=[UIImage imageNamed:[[self.icon objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];//向右的箭头指示
    cell.selectionStyle=UITableViewCellSelectionStyleNone;//选中时无效果
    return cell;
}

@end
