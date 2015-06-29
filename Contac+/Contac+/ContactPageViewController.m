//
//  ContactPageViewController.m
//  Contac+
//
//  Created by Daniel Moreno on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "ContactPageViewController.h"

@interface ContactPageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UISwitch *singleStatusSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;
@property (weak, nonatomic) IBOutlet UIButton *saveContact;
@property (weak, nonatomic) IBOutlet UILabel *recordLabel;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIView *nameView;

@end

@implementation ContactPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (IBAction) saveContactAndTakePicture:(id)sender{
    NSString *name = self.nameField.text;
    NSString *phone = self.phoneField.text;
    BOOL status = self.singleStatusSwitch.isOn;
    BOOL location = self.locationSwitch.isOn;
    NSLog(@"%@, %@, %d single, %d location", name, phone, (int) status, (int) location);

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phoneField resignFirstResponder];
    [self.nameField resignFirstResponder];
    
}

@end
