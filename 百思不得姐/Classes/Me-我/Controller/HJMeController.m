//
//  HJMeController.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/1.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJMeController.h"
#import "HJsettingViewController.h"
#import "HJMeCell.h"
#import "HJMeFooterView.h"

@interface HJMeController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITextField *textfield;
@end
@implementation HJMeController


- (instancetype)init
{
        return [self initWithStyle:UITableViewStyleGrouped];
}

-(void)viewDidLoad{
    
    self.view.backgroundColor = HJBackGroundColor;
    
    self.navigationItem.title = @"我的";
    self.tableView.tableFooterView = [[HJMeFooterView alloc]init];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = Margin;
    self.tableView.contentInset = UIEdgeInsetsMake(Margin-35, 0, 0, 0);
    
    [self setNavItem];
    
}

-(void)setNavItem{
    
    UIBarButtonItem *settingBarItem = [UIBarButtonItem ItemWithImage:@"mine-setting-icon" HighlightImage:@"mine-setting-icon-click" Target:self Action:@selector(settingButtonAction)];
    
    UIBarButtonItem *moonBarItem = [UIBarButtonItem ItemWithImage:@"mine-moon-icon" HighlightImage:@"mine-moon-icon-click" Target:self Action:@selector(moonButtonAction)];
    self.navigationItem.rightBarButtonItems = @[settingBarItem,moonBarItem];

}

-(void)settingButtonAction{
    HJsettingViewController * setting = [[HJsettingViewController alloc]init];
    
    [self.navigationController pushViewController:setting animated:YES];
    
   
}

-(void)moonButtonAction{
    HJLogFUNC
}


#pragma mark -UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//        static NSString *CellID = @"Cell";
//    HJMeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
//    if (!cell) {
//        cell = [[HJMeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
//    }
//    
//    if (indexPath.section == 0) {
//        cell.textLabel.text = @"登录/注册";
//        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
//    }else{
//        cell.textLabel.text = @"离线下载";
//        cell.imageView.image = nil;
//    }
    static NSString *CellID = @"Cell";
    HJMeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[HJMeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
    }else{
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    return cell;
}
@end
