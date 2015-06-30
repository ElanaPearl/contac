//
//  Person.h
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *phoneNumber;
@property (nonatomic,strong) NSString *meetDate;
@property (nonatomic,copy) NSString *location; 
@property (nonatomic,assign) BOOL single;
@property (nonatomic, strong) UIImage *image;

//properties assigned in secret screen
@property (nonatomic,copy) NSString *school;
@property (nonatomic,copy) NSString *hometown;
@property (nonatomic,copy) NSString *major;
@property (nonatomic, copy) NSString *notes;

- (instancetype)initWithName:(NSString *)name
			  phoneNumber:(NSNumber *)number
				single:(BOOL)single NS_DESIGNATED_INITIALIZER;


@end
