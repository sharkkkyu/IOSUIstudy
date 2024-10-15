//
//  SearchViewController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/14.
//

#import "SearchViewController.h"
#import "CustomTableViewCell.h"
#import "SearchDetailVC.h"
@interface SearchViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *searchList;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchList = [[NSMutableArray alloc] init];
    self.dataListArry = [[NSMutableArray alloc] init];
    self.tableView.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

//tableview拖拽 搜索框失去第一响应者 也就是失去焦点
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.searchList.count > 0 ? 44 : 200;
}

//点击搜索结果
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger i = self.searchList.count > 0 ? self.searchList.count : 1;
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.searchList.count > 0) {
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = self.searchList[indexPath.row];
        cell.textLabel.textColor = [UIColor redColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return cell;
    }else{
        CustomTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"CustomTableViewCell" owner:self options:nil][0];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchDetailVC *vc = [[SearchDetailVC alloc]initWithNibName:@"SearchDetailVC" bundle:nil];
    [self.nav pushViewController:vc animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
}
#pragma mark - UISearchResultsUpdating
//每输入一个字符都会执行一次
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"搜索关键字：%@",searchController.searchBar.text);
    searchController.searchResultsController.view.hidden = NO;
    //谓词搜索
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchController.searchBar.text];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    
    //过滤数据
    self.searchList = [NSMutableArray arrayWithArray:[_dataListArry filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}
@end