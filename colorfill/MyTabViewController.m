//
//  MyTableViewController.m
//  jptoutiao
//
//  Created by tian on 2017/09/13.
//  Copyright © 2017年 tian. All rights reserved.
//

#import "MyTabViewController.h"

@interface MyTabViewController ()

@end

@implementation MyTabViewController


const CGFloat kBarHeight = 44;

- (void)viewWillLayoutSubviews {
    
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    
    if (@available(iOS 11.0, *)) {
        tabFrame.origin.y = self.view.frame.size.height - kBarHeight-self.view.safeAreaInsets.bottom;
        tabFrame.size.height = kBarHeight+self.view.safeAreaInsets.bottom;
    } else {
        tabFrame.origin.y = self.view.frame.size.height - kBarHeight;
        tabFrame.size.height = kBarHeight;
        // Fallback on earlier versions
    }
    self.tabBar.frame = tabFrame;
    

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
