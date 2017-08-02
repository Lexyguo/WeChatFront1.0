

#import "meViewController.h"
#import "meTableViewCell.h"
#import "pageItemTableViewCell.h"
#import "Masonry.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface meViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *itemNameArr;
@property (nonatomic,strong) NSArray *iconNameArr;

@end

@implementation meViewController

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
    
    self.itemNameArr = @[@[@""],@[@"钱包"],@[@"收藏",@"相册",@"卡包",@"表情"],@[@"设置"]];
    self.iconNameArr = @[@[@""],@[@"wallet.png"],@[@"collect.png",@"photo album.png",@"card-bag.png",@"sticker-gallery.png"],@[@"set.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return self.itemNameArr.count;
 }
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)[self.itemNameArr objectAtIndex:section]).count;
}
 
 -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     if(section==0){
         return 14.5;
     }
     return 20.5;
}
 
 -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.section == 0) {
         return 90.5;
    }

     return 45;
 }
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *cellIdentifier=@"cell";
 
     if(indexPath.section==0 ){
         meTableViewCell *cellme=[[meTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
         [cellme setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
         [cellme setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];//向右的箭头指示
            cellme.selectionStyle=UITableViewCellSelectionStyleNone;//选中时无效果
         return cellme;
     }
     else {
            //从缓存队列中取出复用的cell
         pageItemTableViewCell *cell=(pageItemTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
         if(cell==nil){
             cell=[[pageItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
             cell.accessoryType=UITableViewCellAccessoryNone;
         }
         [[cell textLabel] setText:[[self.itemNameArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
 
         cell.imageView.image=[UIImage imageNamed:[[self.iconNameArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
 
         [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];//向右的箭头指示
         cell.selectionStyle=UITableViewCellSelectionStyleNone;//选中时无效果
         return cell;
     }
 
 }

@end
