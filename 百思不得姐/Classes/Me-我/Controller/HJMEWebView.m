//
//  HJMEWebView.m
//  百思不得姐
//
//  Created by MrHuang on 17/5/8.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJMEWebView.h"

@interface HJMEWebView ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *MEwebView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *BackItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forWardItem;

@end

@implementation HJMEWebView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.MEwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//按钮点击监听
- (IBAction)back {
    
    [self.MEwebView goBack];
    
}
- (IBAction)forWard {
    
    [self.MEwebView goForward];
    
}
- (IBAction)reload {
    
    [self.MEwebView reload];
    
}



#pragma mark WebViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.BackItem.enabled = webView.canGoBack;
    self.forWardItem.enabled = webView.canGoForward;
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
