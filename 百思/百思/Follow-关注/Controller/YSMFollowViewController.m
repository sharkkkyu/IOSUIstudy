//
//  YSMFollowViewController.m
//  百思
//
//  Created by Songmin Yu on 2024/9/20.
//

#import "YSMFollowViewController.h"
#import "YSMRecommandFollowViewController.h"
#import "YSMloginregisterViewController.h"
@interface YSMFollowViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;


@end

@implementation YSMFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.title = @"我的关注";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"friendsRecommentIcon=click"] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:self action:@selector(followClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.loginbutton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login"] forState:UIControlStateNormal];
    [self.loginbutton setBackgroundImage:[UIImage imageNamed:@"friendsTrend_login_click"] forState:UIControlStateHighlighted];
    [self.loginbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.loginbutton addTarget:self action:@selector(loginbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    

}

-(void)loginbuttonClick
{
    YSMloginregisterViewController *loginregister = [[YSMloginregisterViewController alloc] init];
    loginregister.modalPresentationStyle = 0;
    [self presentViewController:loginregister animated:YES completion:nil];
}
-(void) followClick
{
    YSMRecommandFollowViewController *follow = [[YSMRecommandFollowViewController alloc] init];
    [self.navigationController pushViewController:follow animated:YES];
}
#pragma mark - Table view data source

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
