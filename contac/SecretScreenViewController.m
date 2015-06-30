//
//  SecretScreenViewController.m
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import "SecretScreenViewController.h"
#import "WebViewController.h"

@interface SecretScreenViewController ()

@property (weak, nonatomic) IBOutlet UITextField *schoolField;
@property (weak, nonatomic) IBOutlet UITextField *hometownField;
@property (weak, nonatomic) IBOutlet UITextField *majorField;
@property (weak, nonatomic) IBOutlet UISwitch *singleSwitch;
@property (weak, nonatomic) IBOutlet UIButton *fbookButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *instaButton;
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation SecretScreenViewController


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[self.schoolField resignFirstResponder];
	[self.majorField resignFirstResponder];
	[self.hometownField resignFirstResponder];
}

- (IBAction)loadFacebook:(id)sender {
	WebViewController *webViewController = [[WebViewController alloc] init];
	
	webViewController.loadURL = [NSURL URLWithString:@"http://www.facebook.com"];
	[self presentViewController:webViewController animated:YES completion:nil];
}
- (IBAction)loadTwitter:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com"]];
}

- (IBAction)loadInstagram:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.instagram.com"]];
}





@end
