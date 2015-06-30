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
@property (nonatomic) NSMutableArray *content;
@property (nonatomic) NSMutableArray *initials;
@end

@implementation PersonStore

static NSString *letters = @"abcdefghijklmnopqrstuvwxyz";

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.people = [NSMutableArray array];
        self.initials = [[NSMutableArray alloc] init];
        self.content = [[NSMutableArray alloc] init];
    }
    return self;
    
}
- (NSArray *)allPeople
{
    return [_people copy];
}

- (NSArray *)allInitials {
    return [_initials copy];
}

- (NSArray *)allContent {
    return [_content copy];
}

- (Person *)createPerson
{
    Person *newPerson = [Person randomPerson];
   // [self.people addObject:newPerson];
    
    
    // Get the first char of the name
    NSString *initial = [newPerson.name substringWithRange:[newPerson.name rangeOfComposedCharacterSequenceAtIndex:0]];
    
    if ([_initials containsObject:initial]) {
        
        [_initials sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        NSInteger index = [_initials indexOfObject:initial];
        
        NSMutableDictionary *dictionary = [_content objectAtIndex:index];
        NSMutableArray *peopleWithInitial = [dictionary objectForKey:@[initial]];
        assert(peopleWithInitial);
        [peopleWithInitial addObject:newPerson];
        [dictionary setObject:peopleWithInitial forKey:@[initial]];
        [_content replaceObjectAtIndex:index withObject:dictionary];
        
    }
    
    else {
        [_initials addObject:initial];
        [_initials sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        NSInteger index = [_initials indexOfObject:initial];
        
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        NSMutableArray *peopleWithInitial = [[NSMutableArray alloc] init];
        [peopleWithInitial addObject:newPerson];
        [dictionary setObject:peopleWithInitial forKey:@[initial]];
        [_content insertObject:dictionary atIndex:index];
        
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
