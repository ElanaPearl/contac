//
//  CustomCameraViewController.h
//  Contac+
//
//  Created by Daniel Moreno on 6/29/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CustomCameraViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIImage *myImage;
}
@end
