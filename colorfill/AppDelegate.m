//
//  AppDelegate.m
//  colorfill
//
//  Created by tian on 2018/02/14.
//  Copyright © 2018年 tian. All rights reserved.
//

#import "AppDelegate.h"
#import "HexColors.h"
#import "KSGuaidViewManager.h"
#import "MyTabViewController.h"

#import "TopViewController.h"
#import "WorkListViewController.h"
#import "UpViewController.h"
#import "MyWorkViewController.h"
#import "WorkViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize tabBarController;


-(void)closeWorkPage{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)openWorkPage{
    
    WorkViewController *controller = [[WorkViewController alloc] init];
    
    
    [self.navigationController pushViewController:controller animated:YES];
    
}


+ (instancetype)appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    KSGuaidManager.images = @[[UIImage imageNamed:@"intro_1"],
                              [UIImage imageNamed:@"intro_2"],
                              [UIImage imageNamed:@"intro_3"],
                              [UIImage imageNamed:@"intro_4"]];
    
    KSGuaidManager.shouldDismissWhenDragging = YES;
    [KSGuaidManager begin];
    
    [self initMainTab];
    
    
    return YES;
}

-(void)initMainTab{
    
    self.tabBarController = [[MyTabViewController alloc] initWithNibName:nil bundle:nil];
    
    self.tabBarController.delegate = self;
    
    
    self.tabBarController.navigationController.navigationBarHidden = YES;
    
    TopViewController *tab1Controller = [TopViewController new];
    WorkListViewController *tab2Controller = [WorkListViewController new];
    UpViewController *tab3Controller = [UpViewController new];
    MyWorkViewController *tab4Controller = [MyWorkViewController new];
    
    
    UINavigationController *tab1NaviCtrl = [[UINavigationController alloc] initWithRootViewController:tab1Controller];
    tab1NaviCtrl.navigationBarHidden = YES;
    UINavigationController *tab2NaviCtrl = [[UINavigationController alloc] initWithRootViewController:tab2Controller];
    tab2NaviCtrl.navigationBarHidden = YES;
    UINavigationController *tab3NaviCtrl = [[UINavigationController alloc] initWithRootViewController:tab3Controller];
    tab3NaviCtrl.navigationBarHidden = YES;
    UINavigationController *tab4NaviCtrl = [[UINavigationController alloc] initWithRootViewController:tab4Controller];
    tab4NaviCtrl.navigationBarHidden = YES;
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:tab1NaviCtrl, tab2NaviCtrl,tab3NaviCtrl,tab4NaviCtrl, nil];

    
    tab1Controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"top" image:[UIImage imageNamed:@"tab_news"] tag:0];
    tab2Controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"作品" image:[UIImage imageNamed:@"tab_my"] tag:1];
    tab3Controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"自分の作品" image:[[UIImage imageNamed:@"tab_share"] imageWithRenderingMode:UIImageRenderingModeAutomatic] tag:2];
    tab4Controller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"設定" image:[[UIImage imageNamed:@"tab_setting"] imageWithRenderingMode:UIImageRenderingModeAutomatic] tag:3];
    
    UIFont *tabFont = [UIFont fontWithName:@"NotoSansCJKsc-Light" size:10.0];
    
    NSDictionary *selectedAttributes = @{NSFontAttributeName : tabFont,
                                         NSForegroundColorAttributeName : [UIColor hx_colorWithHexRGBAString:@"29519F"]};
    //通常時のフォントとカラー
    NSDictionary *attributesNormal = @{NSFontAttributeName : tabFont,
                                       NSForegroundColorAttributeName : [UIColor hx_colorWithHexRGBAString:@"929292"]};
    
    
    [tab1Controller.tabBarItem setTitleTextAttributes:selectedAttributes
                                             forState:UIControlStateSelected];
    
    [tab1Controller.tabBarItem setTitleTextAttributes:attributesNormal
                                             forState:UIControlStateNormal];
    [tab2Controller.tabBarItem setTitleTextAttributes:selectedAttributes
                                             forState:UIControlStateSelected];
    
    [tab2Controller.tabBarItem setTitleTextAttributes:attributesNormal
                                             forState:UIControlStateNormal];
    [tab3Controller.tabBarItem setTitleTextAttributes:selectedAttributes
                                             forState:UIControlStateSelected];
    
    [tab3Controller.tabBarItem setTitleTextAttributes:attributesNormal
                                             forState:UIControlStateNormal];
    [tab4Controller.tabBarItem setTitleTextAttributes:selectedAttributes
                                             forState:UIControlStateSelected];
    
    [tab4Controller.tabBarItem setTitleTextAttributes:attributesNormal
                                             forState:UIControlStateNormal];
    
    
    tab1Controller.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    tab2Controller.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    tab3Controller.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    tab4Controller.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    
    UINavigationController *rootnavigationController = [[UINavigationController alloc] initWithRootViewController:self.tabBarController];
    rootnavigationController.navigationBarHidden = YES;
    
    
    
    self.window.rootViewController = rootnavigationController;
    self.navigationController = rootnavigationController;


    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
