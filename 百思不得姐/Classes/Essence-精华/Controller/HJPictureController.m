//
//  HJPictureController.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/19.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJPictureController.h"

@interface HJPictureController ()

@end

@implementation HJPictureController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 50;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellID= @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        
        cell.backgroundColor = HJRandomColor;
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd",[self class],indexPath.row ];
    
    return cell;
}


@end
