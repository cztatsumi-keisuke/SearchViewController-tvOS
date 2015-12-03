//
//  SearchResultViewController.h
//  SearchViewController-tvOS
//
//  Created by Keisuke_Tatsumi on 2015/12/04.
//  Copyright © 2015年 Keisuke Tatsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController <UISearchResultsUpdating>

@property (nonatomic, strong) UITableView *tableView;

@end
