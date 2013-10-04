//
//  jQueryMobileViewController.m
//  jquerymobile
//
//  Created by Goda on 13/10/3.
//  Copyright (c) 2013年 Goda. All rights reserved.
//

#import "jQueryMobileViewController.h"

@interface jQueryMobileViewController ()

@end

@implementation jQueryMobileViewController

@synthesize myWebView;
    
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,screenRect.size.width, screenRect.size.height)];
    [myWebView setDelegate:self];
    [self.view addSubview:myWebView];
    self.myWebView=myWebView;
    
    NSString * fileURL = [[NSBundle mainBundle] pathForResource:@"jquerymobile" ofType:@"html" inDirectory:@"webinfo"];
    NSURL * url = [NSURL URLWithString:[fileURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:urlRequest];
    //myWebView.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [myWebView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"drawPie();"]];
}

@end
