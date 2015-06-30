//
//  PersonStore.h
//  contac
//
//  Created by Katelynn Kyker on 6/29/15.
//  Copyright (c) 2015 Contact+ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface PersonStore : NSObject

-(NSArray *)allPeople;
-(Person *)createPerson;

@end
