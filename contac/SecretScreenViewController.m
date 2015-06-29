//
//  SecretScreenViewController.m
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import "SecretScreenViewController.h"

@interface SecretScreenViewController ()

@property (weak, nonatomic) IBOutlet UITextField *schoolField;
@property (weak, nonatomic) IBOutlet UITextField *hometownField;
@property (weak, nonatomic) IBOutlet UITextField *majorField;
@property (weak, nonatomic) IBOutlet UISwitch *singleSwitch;
@end

@implementation SecretScreenViewController

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[self.schoolField resignFirstResponder];
	[self.majorField resignFirstResponder];
	[self.hometownField resignFirstResponder];
}


@end
