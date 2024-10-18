//
//  MessageTableViewController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/12.
//

#import "MessageTableViewController.h"
#import "../SearchBar/SearchViewController.h"
#import "../SearchBar/View/SearchDetailVC.h"
#import "View/CustomMenuView.h"
#import "Pay/PayViewController.h"
#import "ScanViewController.h"
#import "addFriendsViewController.h"
#import "message/GroupChatViewController.h"
#import "View/MessageListViewCell.h"
#import "MessageList.h"
@interface MessageTableViewController ()<CustomMenuDelegate, UISearchControllerDelegate, UISearchBarDelegate>
@property(strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic)SearchViewController *searchVC;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CustomMenuView *menu;
@property (strong, nonatomic) MessageList *messageList;
@end

@implementation MessageTableViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self initTabBarStyle];
    [self initTableViewStyle];
    [self initOtherStyle];
    [self initSearchController];
    [self setupNavigationBarStyle];
    [self initModel];
}
-(void)initModel {
    self.messageList = [[MessageList alloc] init];
    [self.messageList initMessageList];
}
//初始化样式
-(void) initOtherStyle {
    self.view.backgroundColor = [UIColor whiteColor];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:@"取消"];
}

//初始化tableView样式
-(void) initTableViewStyle {
    self.tableView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
}

- (void)setupNavigationBarStyle {
    self.navigationItem.title = @"微信";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenuList)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void) showMenuList{
    if(self.menu.isSeem) {
        [self.menu removeFromSuperview];
        self.menu.isSeem = NO;
    } else {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self.menu];
        self.menu.isSeem = YES;
    }
}
- (void)CustomMenu:(UITableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"select: %ld",indexPath.row);
    NSArray *arr = @[@"messageViewViewController",@"addFriendsViewController",@"ScanViewController",@"PayViewController"];
    Class viewControllerClass = NSClassFromString(arr[indexPath.row]);
    UIViewController *vc = [[viewControllerClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CustomMenuView *)menu {
    if(!_menu) {
        _menu = [[CustomMenuView alloc] initWithDataArr:@[@"发起群聊", @"添加朋友", @"扫一扫", @"收付款"] origin:CGPointMake(self.view.bounds.size.width - 125, self.navigationController.navigationBar.frame.origin.y+self.navigationController.navigationBar.frame.size.height) width:125 rowHeight:44];
        _menu.delegate = self;
        _menu.arrImgName = @[@"add_message", @"bar_add_friend", @"add_scan", @"add_pay"];
        _menu.isSeem = NO;
    }
    return _menu;
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

#pragma mark - tableView
//设置区域的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

//返回单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"MessageCell";
    MessageListViewCell *cell = (MessageListViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];

    if(!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MessageListViewCell" owner:self options:nil] firstObject];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:216.0/255.0 green:223.0/255.0 blue:229.0 / 255.0 alpha:0.8];
    NSDictionary *message = self.messageList.messages[indexPath.row];
    [cell configureWithMessage:message];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
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
    self.searchVC.dataListArry = self.messageList.nameList;
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    NSLog(@"didPresentSearchController");
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
