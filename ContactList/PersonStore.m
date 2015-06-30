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

static NSString *letters = @"abcdefghijklmnopqrstuvwxyz";

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.people = [NSMutableArray array];
        self.initials = [[NSMutableDictionary alloc] init];
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
    
    
    // Get the first char of the name
    NSString *initial = [newPerson.name substringWithRange:[newPerson.name rangeOfComposedCharacterSequenceAtIndex:0]];
    
    // Add the person into the dictionary matching initial letter -> array of names
    [self.initials setObject:newPerson.name forKey:@[[initial uppercaseString]]];
    
    for (NSString* key in self.initials) {
        NSLog(@"print %@", key);
    }
    
    return newPerson;
}

- (void)removePerson:(Person *)person
{
    [self.people removeObjectIdenticalTo:person];
}

- (void)movePersonAtIndex:(NSInteger)source
                  toIndex:(NSInteger)destination
{
    if (source == destination) {
        return;
    }
    
    id movedPerson = self.people[source];
    
    [self.people removeObjectIdenticalTo:movedPerson];
    [self.people insertObject:movedPerson
                      atIndex:destination];
}



@end
