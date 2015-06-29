//
//  PersonStore.m
//  ContactList
//
//  Created by Jayshree Sarathy on 6/29/15.
//  Copyright (c) 2015 Jayshree Sarathy. All rights reserved.
//

#import "PersonStore.h"
#import "Person.h"

@interface PersonStore ()
@property (nonatomic) NSMutableArray *people;
@end

@implementation PersonStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.people = [NSMutableArray array];
    }
    return self;
    
}
- (NSArray *)allPeople
{
    return [_people copy];
}

- (Person *)createPerson
{
    Person *newPerson = [Person randomPerson];
    [self.people addObject:newPerson];
    return newPerson;
}



@end
