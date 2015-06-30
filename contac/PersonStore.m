//
//  PersonStore.m
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import "PersonStore.h"
#import "Person.h"

@interface PersonStore ()
@property (nonatomic) NSMutableArray *people;
@end

@implementation PersonStore

- (NSArray *)allPeople
{
	return [_people copy];
}

- (Person *)createPerson
{
	Person *newPerson = [[Person alloc]init];
	[self.people addObject:newPerson];
	return newPerson;
}

- (instancetype) init
{
	self = [super init];
	if (self)
	{
		self.people = [NSMutableArray array];
	}
	return self;
}

@end
