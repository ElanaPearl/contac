//
//  SecretScreenViewController.m
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import "SecretScreenViewController.h"
#import "WebViewController.h"

#define kOFFSET_FOR_KEYBOARD 160.0

@interface SecretScreenViewController ()

@property (weak, nonatomic) IBOutlet UITextField *schoolField;
@property (weak, nonatomic) IBOutlet UITextField *hometownField;
@property (weak, nonatomic) IBOutlet UITextField *majorField;
@property (weak, nonatomic) IBOutlet UITextView *notes;


@property (weak, nonatomic) IBOutlet UISwitch *singleSwitch;

@property (weak, nonatomic) IBOutlet UIButton *fbookButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *instaButton;

@property (nonatomic, strong) UIWebView *webView;

//data loaded
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UILabel *atLabel;
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;
@property (weak, nonatomic) IBOutlet UILabel *hometownLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;



- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (IBAction)clickedBackground;

- (void)textViewDidBeginEditing: (UITextView *)textView;
//- (void)textViewDidEndEditing: (UITextView *)textView;
//- (void) animateTextView: (UITextView *)textView up: (BOOL) up;

@end

@implementation SecretScreenViewController

- (void)keyboardWillShow
{
	if (self.view.frame.origin.y >= 0)
	{
		[self setViewMovedUp: YES];
	}
	else if (self.view.frame.origin.y < 0)
	{
		[self setViewMovedUp:NO];
	}
}

-(void)keyboardWillHide {
	if (self.view.frame.origin.y >= 0)
	{
		[self setViewMovedUp:YES];
	}
	else if (self.view.frame.origin.y < 0)
	{
		[self setViewMovedUp:NO];
	}
}


- (void)textViewDidBeginEditing: (UITextView *)sender {
	if ([sender isEqual:self.notes])
	{
		//move the main view, so that the keyboard does not hide it.
		if  (self.view.frame.origin.y >= 0)
		{
			[self setViewMovedUp:YES];
		}
	}
}

-(void)setViewMovedUp:(BOOL)movedUp
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3]; // if you want to slide up the view
	
	CGRect rect = self.view.frame;
	if (movedUp)
	{
		// 1. move the view's origin up so that the text field that will be hidden come above the keyboard
		// 2. increase the size of the view so that the area behind the keyboard is covered up.
		rect.origin.y -= kOFFSET_FOR_KEYBOARD;
		rect.size.height += kOFFSET_FOR_KEYBOARD;
	}
	else
	{
		// revert back to the normal state.
		rect.origin.y += kOFFSET_FOR_KEYBOARD;
		rect.size.height -= kOFFSET_FOR_KEYBOARD;
	}
	self.view.frame = rect;
	
	[UIView commitAnimations];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// register for keyboard notifications
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillShow)
												 name:UIKeyboardWillShowNotification
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillHide)
												 name:UIKeyboardWillHideNotification
											   object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	// unregister for keyboard notifications while not visible.
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillShowNotification
												  object:nil];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillHideNotification
												  object:nil];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[self.schoolField resignFirstResponder];
	[self.majorField resignFirstResponder];
	[self.hometownField resignFirstResponder];
	//[self.notes resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

-(IBAction)clickedBackground
{
	[self.view endEditing:YES];
}

- (IBAction)loadFacebook:(id)sender {
	WebViewController *webViewController = [[WebViewController alloc] init];
	
	webViewController.loadURL = [NSURL URLWithString:@"http://www.facebook.com"];
	[self presentViewController:webViewController animated:YES completion:nil];
	
	//add the speficic person search
}
- (IBAction)loadTwitter:(id)sender {
	WebViewController *webViewController = [[WebViewController alloc] init];
	
	webViewController.loadURL = [NSURL URLWithString:@"http://www.twitter.com"];
	[self presentViewController:webViewController animated:YES completion:nil];
}

- (IBAction)loadInstagram:(id)sender {
	WebViewController *webViewController = [[WebViewController alloc] init];
	
	webViewController.loadURL = [NSURL URLWithString:@"http://www.instagram.com"];
	[self presentViewController:webViewController animated:YES completion:nil];;
}






@end
