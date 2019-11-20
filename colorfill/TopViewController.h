//
//  TopViewController.h
//  colorfill
//
//  Created by tian on 2018/02/14.
//  Copyright © 2018年 tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *picList;

@property (nonatomic, weak, nullable) id <UITableViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id <UITableViewDelegate> delegate;

@end
