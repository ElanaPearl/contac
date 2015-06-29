//
//  Person.h
//  ContactList
//
//  Created by Jayshree Sarathy on 6/29/15.
//  Copyright (c) 2015 Jayshree Sarathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, strong) Person *containedPerson;
@property (nonatomic, weak) Person *container;

@property (nonatomic, copy) NSString *name;


- (instancetype)initWithName:(NSString *)name;

+ (instancetype) randomPerson;

@end


