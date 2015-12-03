//
//  SearchResultViewController.m
//  SearchViewController-tvOS
//
//  Created by Keisuke_Tatsumi on 2015/12/04.
//  Copyright © 2015年 Keisuke Tatsumi. All rights reserved.
//

#import "SearchResultViewController.h"

const CGFloat kSafetyZoneSide = 90;
const CGFloat kSafetyZoneTopAndBottom = 60;
const CGFloat kNavigationBarHeight = 145;

static NSString * kCellIdentifier = @"resultCell";

@interface SearchResultViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *resultArray;

@end

@implementation SearchResultViewController

#pragma mark - Lyfe Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resultArray = [[NSMutableArray alloc]init];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(kSafetyZoneSide, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - kSafetyZoneSide*2, CGRectGetHeight([UIScreen mainScreen].bounds) - kNavigationBarHeight)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, kSafetyZoneTopAndBottom, 0);
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier
                                                            forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:kCellIdentifier];
    }
    
    if (_resultArray.count > 0) {
        cell.textLabel.text = (NSString *)_resultArray[indexPath.row];
    }
    
    cell.textLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"Selected cell's title is %@", (NSString *)_resultArray[indexPath.row]);
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    [_resultArray removeAllObjects];
    
    if ([searchController.searchBar.text isEqualToString:@""]) {
        [_resultArray addObjectsFromArray:[self getAllItems]];
        [self.tableView reloadData];
    }
    else {
        [self loadResultArrayWithSearchText:searchController.searchBar.text];
        [_tableView reloadData];
    }
}

#pragma mark - Private Methods

- (NSArray *)getAllItems {
    
    return @[@"yui",
             @"mio",
             @"ritsu",
             @"tsumugi",
             @"azusa",
             @"ui",
             @"jyun",
             @"sawako",
             @"nodoka",
             @"megumi",
             @"sumire",
             @"nao",
             @"akira",
             @"sachi",
             @"ayame",
             @"Ho-Kago Tea Time"];
}

- (void)loadResultArrayWithSearchText:(NSString *)searchText {
    
    
    for (NSString *item in [self getAllItems]) {
        
        NSRange range = [item rangeOfString:searchText];
        if (range.location != NSNotFound) {
            [_resultArray addObject:item];
        }
    }
}

@end
