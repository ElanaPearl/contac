//
//  APPChildViewController.m
//  Contac+
//
//  Created by Daniel Moreno on 6/30/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "APPViewController.h"
#import "SecretScreenViewController.h"
#import "ContactPageViewController.h"
#import "AudioViewController.h"


@interface APPViewController ()

@property (nonatomic, copy) NSArray *controllers;

@end

@implementation APPViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.index = 1;
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    ContactPageViewController *cpvc = [[ContactPageViewController alloc]init];
    AudioViewController *pvc = [[AudioViewController alloc]init];

    SecretScreenViewController *ssvc;
    
    self.controllers= [NSArray arrayWithObjects: cpvc, ssvc, pvc, nil];
    
    [self.pageController setViewControllers:self.controllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    if ([viewController isKindOfClass:[ContactPageViewController class]]){
        AudioViewController *pvc = [[AudioViewController alloc]init];
        return pvc;
    } else if ([viewController isKindOfClass:[SecretScreenViewController class]]){
        ContactPageViewController *cpvc = [[ContactPageViewController alloc]init];
        return  cpvc;
    } else return nil;
    
    }

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if ([viewController isKindOfClass:[ContactPageViewController class]]){
        SecretScreenViewController *ssvc = [[SecretScreenViewController alloc]init];
        return ssvc;
    } else if ([viewController isKindOfClass:[AudioViewController class]]){
        ContactPageViewController *cpvc = [[ContactPageViewController alloc]init];
        return  cpvc;
    } else return nil;


    
}






@end
