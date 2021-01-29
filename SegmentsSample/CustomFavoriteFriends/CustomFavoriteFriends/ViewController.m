//
//  ViewController.m
//  CustomFavoriteFriends
//
//  Created by macOS Catalina on 25/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//
#import "ViewController.h"
#import "FriendTableCell.h"

@interface ViewController()

@end

@implementation ViewController

@synthesize FriendsSegment, AllFriendsTableView;
NSMutableArray *schoolFriends;
NSMutableArray *collegeFriends;
NSMutableArray *officeCollegues;
NSMutableDictionary *friendsTableData;
NSArray *sectionsInDict;
NSMutableArray *favoritesTableData;
NSInteger selectedSegment = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    schoolFriends = [[NSMutableArray alloc] initWithObjects:@"Pavan", @"Antil", @"Ark", nil];
    collegeFriends = [[NSMutableArray alloc] initWithObjects:@"Ravan", @"Sunil", @"Ramesh", nil];
    officeCollegues = [[NSMutableArray alloc] initWithObjects:@"Sravan", @"Travis", @"Weeknd", nil];
    friendsTableData = [[NSMutableDictionary alloc] initWithObjectsAndKeys: schoolFriends, @"School Friends", collegeFriends, @"College Friends" ,officeCollegues, @"Office Collegues", nil];
    sectionsInDict = [friendsTableData allKeys];
    favoritesTableData = [[NSMutableArray alloc] init];
    NSLog(@"%@", friendsTableData);
    // Do any additional setup after loading the view.
}

- (IBAction)switchSegment:(id)sender {
    switch (FriendsSegment.selectedSegmentIndex)
    {
    case 0:
        selectedSegment = 0;
        [AllFriendsTableView reloadData];
        break;
    case 1:
        selectedSegment = 1;
        [AllFriendsTableView reloadData];
    default:
        break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(selectedSegment==0)
        return [friendsTableData count];
    else
        return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *friendCell = @"friendTableCell";
    FriendTableCell *cell = (FriendTableCell *)[tableView dequeueReusableCellWithIdentifier:friendCell];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FriendCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    if(selectedSegment==0){
        cell.nameLabel.text = [[friendsTableData objectForKey:[sectionsInDict objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        cell.thumbnailImage.image = [UIImage systemImageNamed:@"person.fill"];
        cell.addButton.tag = (1000 * (indexPath.section + 1)) + indexPath.row;
        [cell.addButton addTarget:self action:@selector(clickedAddButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        cell.nameLabel.text = [favoritesTableData objectAtIndex:indexPath.row];
        cell.thumbnailImage.image = [UIImage systemImageNamed:@"person.fill"];
    }
    return cell;
    
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(selectedSegment == 0)
        return [[friendsTableData objectForKey:[sectionsInDict objectAtIndex:section]] count];
    else
        return [favoritesTableData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(selectedSegment==0)
        return [sectionsInDict objectAtIndex:section];
    else
        return @"";
}

- (void)addCellToFavorites:(NSIndexPath *)indexPath{
        NSString *selectedContact = [[friendsTableData objectForKey:[sectionsInDict objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        if(![favoritesTableData containsObject:selectedContact])
            [favoritesTableData addObject:selectedContact];
}

- (void)clickedAddButton:(UIButton *)sender{
    if(selectedSegment==0){
    UIImage *img = [UIImage systemImageNamed:@"checkmark"];
    [sender setImage:img forState:UIControlStateNormal];
    NSInteger section = (sender.tag/1000) - 1;
    NSInteger row = sender.tag % 1000;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    sender.enabled = NO;
    sender.alpha = 0.5;
    [self addCellToFavorites:indexPath];
    }
}

@end
