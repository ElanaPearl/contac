//
//  CustomCamera.m
//  Contac+
//
//  Created by Daniel Moreno on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "CustomCamera.h"

@implementation CustomCamera

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self takePicture];
    NSLog(@"asfa");
}


@end
