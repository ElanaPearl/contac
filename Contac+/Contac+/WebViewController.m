//
//  WebViewController.m
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.loadURL];
	[self.webView loadRequest:urlRequest];
}

- (IBAction)close:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
