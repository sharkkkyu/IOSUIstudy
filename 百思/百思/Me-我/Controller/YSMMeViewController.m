//
//  YSMMeViewController.m
//  百思
//
//  Created by Songmin Yu on 2024/9/20.
//

#import "YSMMeViewController.h"
#import "YSMsettingsViewController.h"
#import <SDWebImage/SDWebImage.h>
@interface YSMMeViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *downloadButton;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) SDWebImageDownloader *imageDownloader;
@property (nonatomic, strong) SDWebImageDownloadToken *downloadToken;
@property (nonatomic, assign) BOOL isDownloading;
@end

@implementation YSMMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemYellowColor];
    
    self.navigationItem.title = @"我的";
    
    UIButton *settingbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingbutton setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [settingbutton setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [settingbutton sizeToFit];
    [settingbutton addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *settingitem = [[UIBarButtonItem alloc] initWithCustomView:settingbutton];
    
    
    UIButton *moonbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moonbutton setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [moonbutton setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    [moonbutton sizeToFit];
    [moonbutton addTarget:self action:@selector(moonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *moonitem = [[UIBarButtonItem alloc] initWithCustomView:moonbutton];
    self.navigationItem.rightBarButtonItems = @[settingitem, moonitem];
#pragma mark - SDWebImage
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 300, 300)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.frame = CGRectMake(50, 420, 300, 20);
    [self.view addSubview:self.progressView];
    
    
    self.downloadButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.downloadButton.frame = CGRectMake(150, 460, 100, 50);
        [self.downloadButton setTitle:@"开始下载" forState:UIControlStateNormal];
        [self.downloadButton addTarget:self action:@selector(downloadButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.downloadButton];
    
    self.imageDownloader = [SDWebImageDownloader sharedDownloader];
       self.isDownloading = NO;
   
    
}
-(void)downloadButtonTapped
{
    NSURL *imageurl = [NSURL URLWithString:@"https://img.meituan.net/smartvenus/f8bcdb2815f70f676957e9b831df8837424838.jpg@80Q%7Cpr=1"];
    self.downloadToken = [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:imageurl options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            float progress = (float) receivedSize / (float) expectedSize;
            self.progressView.progress = progress;
        });
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        if(image && finished){
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
                
        
            });
        }
    }];
}

-(void) settingClick
{
    YSMsettingsViewController *settingsVc = [[YSMsettingsViewController alloc] init];
    [self.navigationController pushViewController:settingsVc animated:YES];
}
-(void) moonClick
{

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

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
