//
//  TopViewController.m
//  colorfill
//
//  Created by tian on 2018/02/14.
//  Copyright © 2018年 tian. All rights reserved.
//

#import "AppDelegate.h"
#import "TopViewController.h"
#import "TopTableViewCell.h"
#import "WorkViewController.h"

@interface TopViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picList.delegate = self;
    self.picList.dataSource = self;
    
    
    // カスタムセルを使用
    UINib *nib = [UINib nibWithNibName:@"TopTableViewCell" bundle:nil];
    [self.picList registerNib:nib forCellReuseIdentifier:@"Cell"];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}

// セルの高さ設定
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 320;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // カスタムセルを取得
    TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //[cell.imgView setImage: [UIImage imageNamed:@"hair1.jpeg" ]];
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    //    DetailInfoViewController *detailViewController = [[DetailInfoViewController alloc] init];
    //
    //    // Pass the selected object to the new view controller.
    //
    //    // Push the view controller.
    //    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [[AppDelegate appDelegate] openWorkPage];
    
     
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
