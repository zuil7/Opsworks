//
//  ViewController.m
//  GemsOpsworks
//
//  Created by Louise on 15/10/14.
//  Copyright (c) 2014 Louise. All rights reserved.
//

#import "ViewController.h"

#define urlLink @"http://gems-dev-1048623736.ap-southeast-2.elb.amazonaws.com/"

@interface ViewController ()

@property(nonatomic,strong) UIActivityIndicatorView *spinner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.spinner = [[UIActivityIndicatorView alloc]
                    initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = self.spinner.frame;
    frame.origin.x = self.view.frame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = self.view.frame.size.height / 2 - frame.size.height / 2;
    self.spinner.frame = frame;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    
    //Set User Define
    NSString *aLink = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"ApiURL"];
   
    NSURL *url = [NSURL URLWithString:aLink];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
    
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate methods

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner removeFromSuperview];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   [self.spinner removeFromSuperview];
}


@end
