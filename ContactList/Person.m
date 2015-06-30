//
//  Person.m
//  ContactList
//
//  Created by Jayshree Sarathy on 6/29/15.
//  Copyright (c) 2015 Jayshree Sarathy. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    _name = name;
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"John Doe"];
    
}

+ (instancetype)randomPerson
{
    NSArray *randomNameList = @[@"Nikita", @"Daniel", @"Elana"];
    
    NSArray *randomLastNameList = @[@"Rau", @"Patrick", @"Simon"];
    
    unsigned int nameIndex = arc4random_uniform((unsigned int)[randomNameList count]);
    unsigned int lastNameIndex = arc4random_uniform((unsigned int)[randomLastNameList count]);
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomNameList objectAtIndex:nameIndex],
                            [randomLastNameList objectAtIndex:lastNameIndex]];
    
    Person *newPerson = [[self alloc] initWithName:randomName];
    
    return newPerson;
}


@end
