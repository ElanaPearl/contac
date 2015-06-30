//
//  PersonStore.h
//  ContactList
//
//  Created by Jayshree Sarathy on 6/29/15.
//  Copyright (c) 2015 Jayshree Sarathy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface PersonStore : NSObject

- (NSDictionary *) allInitials;
- (Person *) createPerson;
- (NSArray *)allPeople;
- (void)removePerson:(Person *)person;
- (void)movePersonAtIndex:(NSInteger)source
                  toIndex:(NSInteger)destination;

@end
