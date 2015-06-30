//
//  Person.m
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name phoneNumber:(NSNumber *)number single:(BOOL)single
{
	self = [super init];
	if(self)
	{
		_name = name;
		_phoneNumber = number;
		_single = single;
		_meetDate = [[NSDate alloc]init];
		//find out how to get location
		//add picture
	}
	return self;
}

- (instancetype)init
{
	return [self initWithName:@"" phoneNumber:0 single:YES];
}

@end
