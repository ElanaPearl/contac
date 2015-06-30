//
//  Item.m
//  RandomItems
//
//  Created by Katelynn Kyker on 6/18/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "Item.h"

@interface Item ()
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
@end

@implementation Item

+ (instancetype)randomItem
{
	NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
	
	NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
	
	unsigned int adjectiveIndex = arc4random_uniform((unsigned int)[randomAdjectiveList count]);
	unsigned int nounIndex = arc4random_uniform((unsigned int)[randomNounList count]);
	
	NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
	
	int randomValue = arc4random_uniform(100);
	
	NSString *randomSerialNumber = [[[NSUUID UUID] UUIDString] substringToIndex:5];
	
	Item *newItem = [[self alloc] initWithName: randomName
								valueInDollars:randomValue
								  serialNumber:randomSerialNumber];	
	return newItem;
}

- (NSString *)description
{
	NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
								self.name, self.serialNumber, self.valueInDollars, self.dateCreated];
	
	return descriptionString;
}

- (instancetype)initWithName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
	self = [super init];
	
	if(self)
	{
		_name = name;
		_serialNumber = sNumber;
		_valueInDollars = value;
		_dateCreated = [[NSDate alloc] init];
		_itemKey = [[NSUUID UUID] UUIDString];
	}
	return self;
}

- (instancetype)initWithName:(NSString *)name
{
	return [self initWithName:name
			   valueInDollars:0
				 serialNumber:@""];
}

- (instancetype)init
{
	return [self initWithName:@"Item"];
}

- (void)setContainedItem:(Item *)containedItem
{
	_containedItem = containedItem;
	self.containedItem.container = self;
}

- (void)dealloc
{
	NSLog(@"Destroyed: %@", self);
}

//ENCODING

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
	[aCoder encodeObject:self.itemKey forKey:@"itemKey"];
	[aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
	[aCoder encodeInt:self.valueInDollars forKey:@"valueInDollars"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	if(self)
	{
		_name = [aDecoder decodeObjectForKey:@"name"];
		_dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
		_itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
		_serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
		_valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
	}
	
	return self;
}

@end
