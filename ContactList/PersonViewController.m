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
@end



@implementation PersonViewController

- (IBAction)addNewPerson:(id)sender {
    
}

- (IBAction)toggleEditingMode:(id)sender {
    
}

- (instancetype)initWithPersonStore:(PersonStore *)store
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.personStore = store;
        
        for (int i = 0; i < 5; i++) {
            [self.personStore createPerson];
        }
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.personStore.allPeople.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    Person *person = self.personStore.allPeople[indexPath.row];
    cell.nameLabel.text = person.name;
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *personCellNib = [UINib nibWithNibName:@"PersonCell" bundle:nil];
    [self.tableView registerNib:personCellNib forCellReuseIdentifier:@"PersonCell"];
    
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    self.tableView.tableHeaderView = self.headerView;
}



@end


