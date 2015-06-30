//
//  PersonViewController.m
//  
//
//  Created by Jayshree Sarathy on 6/29/15.
//
//

#import "PersonViewController.h"
#import "PersonStore.h"
#import "Person.h"
#import "PersonCell.h"

@interface PersonViewController ()

@property (nonatomic) PersonStore *personStore;
@property (nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, copy) NSArray *content;
@property (nonatomic, copy) NSArray *indices;

@end



@implementation PersonViewController

- (IBAction)addNewPerson:(id)sender {
    Person *newPerson = [self.personStore createPerson];
    
    NSString *initial = [newPerson.name substringWithRange:[newPerson.name rangeOfComposedCharacterSequenceAtIndex:0]];
    
    NSInteger section = [self.personStore.allInitials indexOfObject:initial];
                     //    indexOfObjectIdenticalTo:initial];
    
    NSInteger index = [ [ [self.personStore.allContent objectAtIndex:section] objectForKey:@[initial]]
                       indexOfObject:newPerson];
    
  //  NSRange range = NSMakeRange(0, [_content count]);
    
  /*  [self.tableView insertSections:[NSIndexSet indexSetWithIndex:section
                  withRowAnimation:UITableViewRowAnimationNone]; */
     
     [self.tableView insertSections:[NSIndexSet indexSetWithIndex:[_content count]]
                   withRowAnimation:UITableViewRowAnimationFade];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:section];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
    
}

/*- (NSInteger)addPersonToInitialsDictionary:(Person *)person {
    
}

- (NSInteger)itemNumberWithPerson:(Person *)person {
    
}

- (NSInteger)sectionNumberWithPerson:(Person *)person {
    
}

- (NSIndexPath *)indexPathWithPerson:(Person *)person {
    
}*/

- (IBAction)toggleEditingMode:(id)sender {
    if (self.editing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (instancetype)initWithPersonStore:(PersonStore *)store
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.personStore = store;
        
        for (int i = 0; i < 15; i++) {
            [self.personStore createPerson];
            
        }
    }
    _content = self.personStore.allContent;
    _indices = self.personStore.allInitials;
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    _indices = self.personStore.allInitials;
    NSString *initial = _indices[section];
    
    return [[[_content objectAtIndex:section] objectForKey:@[initial]] count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  /*  PersonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    Person *person = self.personStore.allPeople[indexPath.row];
    cell.nameLabel.text = person.name;
    
    return cell;*/
    
    PersonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PersonCell"];

    _indices = [_personStore allInitials];
    NSString *initial = _indices[indexPath.section];
    
    cell.nameLabel.text = [[[[_content objectAtIndex:indexPath.section] objectForKey:@[initial]]
                           objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _content = [_personStore allContent];
    _indices = [_personStore allInitials];
    
    UINib *personCellNib = [UINib nibWithNibName:@"PersonCell" bundle:nil];
    [self.tableView registerNib:personCellNib forCellReuseIdentifier:@"PersonCell"];
    
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        Person *person = self.personStore.allPeople[indexPath.row];
        [self.personStore removePerson:person];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.personStore movePersonAtIndex:sourceIndexPath.row
                                toIndex:destinationIndexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger count = [_content count];
    NSLog(@"%lu %lu", (unsigned long)[_content count], (unsigned long)[_indices count]);
    return [_content count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _indices;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [_indices indexOfObject:title];
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    return [_indices objectAtIndex:section];
    
}


@end


