//
//  PersonViewController.h
//  
//
//  Created by Jayshree Sarathy on 6/29/15.
//
//

#import <UIKit/UIKit.h>
@class PersonStore;


@interface PersonViewController : UITableViewController


- (instancetype)initWithPersonStore:(PersonStore *)store;

@end
