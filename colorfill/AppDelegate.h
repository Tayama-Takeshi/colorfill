//
//  AppDelegate.h
//  colorfill
//
//  Created by tian on 2018/02/14.
//  Copyright © 2018年 tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) UINavigationController *navigationController;

@property (nonatomic, retain) UITabBarController *tabBarController;

+ (instancetype)appDelegate;
-(void)openWorkPage;
-(void)closeWorkPage;


@end

