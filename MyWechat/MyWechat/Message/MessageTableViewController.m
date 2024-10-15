//
//  MessageTableViewController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/12.
//

#import "MessageTableViewController.h"
#import "../SearchBar/SearchViewController.h"
#import "../SearchBar/View/SearchDetailVC.h"
@interface MessageTableViewController ()<UISearchControllerDelegate, UISearchBarDelegate>
@property(strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic)SearchViewController *searchVC;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataListArry;

@end

@implementation MessageTableViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    [self initTabBarStyle];
    [self initTableViewStyle];
    [self initOtherStyle];
    [self initSearchController];
}

//初始化样式
-(void) initOtherStyle {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"微信";
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:@"取消"];
}

//初始化tableView样式
-(void) initTableViewStyle {
    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
}

//初始化tabbar样式
-(void) initTabBarStyle {

    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.tabBar.translucent = YES;
    UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
    //设置未选中字体属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [appearance.stackedLayoutAppearance.normal setTitleTextAttributes:normalAttrs];
    //设置选中状态字体属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:35.0 / 255.0 green:177.0 / 255.0 blue:45.0 / 255.0 alpha:1.0];
    [appearance.stackedLayoutAppearance.selected setTitleTextAttributes:selectedAttrs];
    appearance.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    appearance.backgroundEffect = nil;
    self.tabBarController.tabBar.scrollEdgeAppearance = appearance;
    self.tabBarController.tabBar.standardAppearance = appearance;
}

//初始化SearchController
- (void)initSearchController{
    [self initData];
    self.searchVC = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
    //创建UISearchController
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.searchVC];
    self.searchController.searchResultsUpdater = self.searchVC;
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.placeholder = @"搜索";
    
    
    //包着搜索框外层的颜色
    self.searchController.searchBar.tintColor = [UIColor colorWithRed:22.0/255 green:161.0/255 blue:1.0/255 alpha:1];
    if (@available(iOS 11.0, *)) {
        self.navigationItem.searchController = self.searchController;
    } else {
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    self.definesPresentationContext = YES;
    self.searchVC.nav = self.navigationController;
    self.searchVC.searchBar = self.searchController.searchBar;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

//产生3个随机字母
- (NSString *)shuffledAlphabet {
    NSMutableArray * shuffledAlphabet = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
    
    NSString *strTest = [[NSString alloc]init];
    for (int i=0; i<3; i++) {
        int x = arc4random() % 25;
        strTest = [NSString stringWithFormat:@"%@%@",strTest,shuffledAlphabet[x]];
    }
    return strTest;
}

//初始化数据
-(void) initData {
    self.dataListArry = [NSMutableArray arrayWithCapacity:100];
    //产生100个数字+三个随机字母
    for (NSInteger i =0; i<100; i++) {
        [self.dataListArry addObject:[NSString stringWithFormat:@"%ld%@",(long)i,[self shuffledAlphabet]]];
    }
}

#pragma mark - tableView
//设置区域的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataListArry count];
}

//返回单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.backgroundColor = [UIColor whiteColor];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    // 使用 attributedText 属性设置文本颜色为黑色
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.dataListArry[indexPath.row]];
    [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, attributedText.length)];
    cell.textLabel.attributedText = attributedText;
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    cell.backgroundView = backgroundView;
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.backgroundColor = [UIColor colorWithRed:216.0/255.0 green:223.0/255.0 blue:229.0 / 255.0 alpha:0.8]; // 你想要的颜色
    cell.selectedBackgroundView = selectedBackgroundView;
    return cell;
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    SearchDetailVC *vc = [[SearchDetailVC alloc]initWithNibName:@"SearchDetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
//    self.searchController.active = NO;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchVC.searchBar setShowsCancelButton:NO animated:YES];
}

#pragma mark - UISearchControllerDelegate代理
//测试UISearchController的执行过程
- (void)willPresentSearchController:(UISearchController *)searchController {
    NSLog(@"willPresentSearchController");
    CGRect searchResultsFrame = self.searchVC.view.frame;
    searchResultsFrame.origin.y = CGRectGetMaxY(self.searchController.searchBar.frame);
    self.searchVC.view.frame = searchResultsFrame;
    self.tabBarController.tabBar.hidden = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    NSLog(@"this is searchController %f,%f",self.searchController.view.frame.origin.y,self.searchController.view.frame.size.height);
    NSLog(@"this is searchVC %f,%f",self.searchVC.view.frame.origin.y,self.searchVC.view.frame.size.height);
 
    

}

- (void)didPresentSearchController:(UISearchController *)searchController {
    NSLog(@"didPresentSearchController");
    self.searchVC.dataListArry = self.dataListArry;
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    NSLog(@"willDismissSearchController");
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    NSLog(@"didDismissSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController {
    NSLog(@"presentSearchController");
}

@end
