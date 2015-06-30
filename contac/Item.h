//
//  Item.h
//  RandomItems
//
//  Created by Katelynn Kyker on 6/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic, assign) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, strong) Item *containedItem;
@property (nonatomic, weak) Item *container;

@property (nonatomic, copy) NSString *itemKey;

+ (instancetype)randomItem;

- (instancetype)initWithName:(NSString *)name
			   valueInDollars:(int)value
				 serialNumber:(NSString *)sNumber NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithName:(NSString *)name;


@end
