//
//  HJAllController.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/19.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJAllController.h"
#import "HJTopicModel.h"
#import "HJSessionManager.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "HJRefresh.h"
#import "HJFooterRefresh.h"
#import "HJExtrenMargin.h"

@interface HJAllController ()
/*所有帖子数组*/
@property(nonatomic,strong) NSMutableArray <HJTopicModel *> *topcieArray;
/*maxtime:用来加载最后下一页数据*/
@property(nonatomic,copy) NSString *maxtime;

/*任务管理者*/
@property(nonatomic,strong)HJSessionManager *manager;

@end

@implementation HJAllController


-(HJSessionManager *)manager{
    
    if (!_manager) {
        
        _manager = [HJSessionManager manager];
    }

    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;

    [self setRefresh];
//    [self loadViewData];
    
}

-(void)setRefresh{
    
    
    self.tableView.mj_header = [HJRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadViewData)];
    
    [self.tableView.mj_header beginRefreshing];
    
    //上拉加载更多数据
    self.tableView.mj_footer = [HJFooterRefresh footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
    
}

//加载数据
-(void)loadViewData{
    
    /**
     *  防止上拉加载 和下拉刷新同时进行请求冲突。
     */
    
//    //取消其他的请求方法一:
//    for (NSURLSessionTask * task in self.manager.tasks) {
//        [task cancel];
//    }
    
    //取消其他的请求方法二：（等同于方法一）
    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    //取消其他的请求方法三：
    //关闭NSURLSession并取消所有的请求，且Session关闭了不能再GET了。
//    [self.manager invalidateSessionCancelingTasks:YES];

    NSMutableDictionary *parma = [NSMutableDictionary dictionary];
    parma[@"a"] = @"list";
    parma[@"c"] = @"data";
    
    [self.manager GET:CommonURL parameters:parma progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //存储本页的时间
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
//        [responseObject writeToFile:@"/Users/Mrhuang/Desktop/list1.plist" atomically:YES];
     self.topcieArray = [HJTopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.tableView reloadData];
        
        //结束刷新
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HJLog(@"网络请求失败-%@",error);
        [self.tableView.mj_header endRefreshing];
    }];

}


//加载更多数据
-(void)loadMoreTopics{
    /**
     *  防止上拉加载 和下拉刷新同时进行请求冲突。
     */
    //关闭所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    NSMutableDictionary *parma = [NSMutableDictionary dictionary];
    parma[@"a"] = @"list";
    parma[@"c"] = @"data";
    parma[@"maxtime"] = self.maxtime;

    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parma progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //存储本页服务器对应的时间。
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        //字典数组->模型
        NSArray <HJTopicModel *> *moreTopicArray = [HJTopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.topcieArray addObjectsFromArray:moreTopicArray];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
        
//        [responseObject writeToFile:@"/Users/Mrhuang/Desktop/mote_Topic.plist" atomically:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        HJLog(@"网络请求失败-%@",error);
        [self.tableView.mj_footer endRefreshing];

        
    }];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.topcieArray.count;
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellID= @"cell";
    
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]
                                 initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellID];

        cell.backgroundColor = HJRandomColor;
        
    }
    
    HJTopicModel *topice = self.topcieArray[indexPath.row];
    cell.textLabel.text = topice.name;
    cell.detailTextLabel.text = topice.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topice.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}

@end
