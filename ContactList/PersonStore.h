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

- (NSArray *)allPeople;
- (Person *)createPerson;

@end
