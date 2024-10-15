//
//  SearchViewController.h
//  MyWechat
//
//  Created by Songmin Yu on 2024/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UISearchResultsUpdating>
@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *dataListArry;
@end

NS_ASSUME_NONNULL_END
