//
//  APPChildViewController.h
//  Contac+
//
//  Created by Daniel Moreno on 6/30/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface APPViewController :  UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property (assign, nonatomic) NSInteger index;

@end

