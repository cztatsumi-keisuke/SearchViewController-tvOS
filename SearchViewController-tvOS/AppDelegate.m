//
//  AppDelegate.m
//  SearchViewController-tvOS
//
//  Created by Keisuke_Tatsumi on 2015/12/04.
//  Copyright © 2015年 Keisuke Tatsumi. All rights reserved.
//

#import "AppDelegate.h"
#import "SearchResultViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    SearchResultViewController *searchResultViewController = [[SearchResultViewController alloc]init];
    UISearchController *searchController = [[UISearchController alloc]initWithSearchResultsController:searchResultViewController];
    searchController.searchResultsUpdater = searchResultViewController;
    searchController.hidesNavigationBarDuringPresentation = NO;
    searchController.searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
    searchController.searchBar.placeholder = @"";
    searchController.view.backgroundColor = [UIColor blackColor];
    searchResultViewController.tableView.tableHeaderView = searchController.searchBar;
    UISearchContainerViewController *containerViewController = [[UISearchContainerViewController alloc]initWithSearchController:searchController];
    containerViewController.title = @"Search";
    UINavigationController *topNavigationController = [[UINavigationController alloc]initWithRootViewController:containerViewController];
    topNavigationController.navigationBar.translucent = NO;
    topNavigationController.navigationBar.barTintColor = [UIColor blackColor];
    [topNavigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                    NSFontAttributeName : [UIFont fontWithName:@"HirakakuProN-W3" size:57]}];
    self.window.rootViewController = topNavigationController;
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
