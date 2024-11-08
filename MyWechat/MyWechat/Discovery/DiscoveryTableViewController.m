//
//  DiscoveryTableViewController.m
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/12.
//

#import "DiscoveryTableViewController.h"

@interface DiscoveryTableViewController ()<WKUIDelegate>
@property WKWebView *web;
@end

@implementation DiscoveryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    self.navigationItem.title = @"发现";
    WKWebViewConfiguration *webConfiguration = [[WKWebViewConfiguration alloc] init];
    _web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2) configuration:webConfiguration];
//    加载外部url
//    NSString *urlstr = @"https://www.meituan.com/";
//    NSURL *url = [NSURL URLWithString:urlstr];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//    [_web loadRequest:request];
    
//    加载本地html
    _web.UIDelegate = self;
    WKWebpagePreferences *preferences = [[WKWebpagePreferences alloc] init];
    preferences.allowsContentJavaScript = YES; //允许网页内容中的JavaScript代码执行
    webConfiguration.defaultWebpagePreferences = preferences;
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *htmlURL = [NSURL fileURLWithPath:htmlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    [_web loadRequest:request];
    [self.view addSubview:self.web];
    
    
}
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if(!navigationAction.targetFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
@end
