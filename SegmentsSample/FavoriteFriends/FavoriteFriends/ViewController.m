//
//  ViewController.m
//  FavoriteFriends
//
//  Created by macOS Catalina on 20/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    officeCollegues = [[NSMutableArray alloc] initWithObjects:@"Ravan", @"Sunil", @"Ramesh", nil];
    friendsTableData = [[NSMutableDictionary alloc] initWithObjectsAndKeys: schoolFriends, @"School Friends", collegeFriends, @"College Friends", officeCollegues, @"Office Collegues", nil];
    sectionsInDict = [friendsTableData allKeys];
    favoritesTableData = [[NSMutableArray alloc] init];
    NSLog(@"%@", friendsTableData);
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

- (IBAction)AddToFav:(id)sender {
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(selectedSegment==0)
        return [friendsTableData count];
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if(selectedSegment==0){
        cell.textLabel.text = [[friendsTableData objectForKey:[sectionsInDict objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage systemImageNamed:@"person.2.fill"];
    }
    else{
        cell.textLabel.text = [favoritesTableData objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage systemImageNamed:@"person.2.fill"];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(selectedSegment == 0)
        return [[friendsTableData objectForKey:[sectionsInDict objectAtIndex:section]] count];
    else
        return [favoritesTableData count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(selectedSegment==0)
        return [sectionsInDict objectAtIndex:section];
    else
        return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(selectedSegment==0){
        NSString *selectedContact = [[friendsTableData objectForKey:[sectionsInDict objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        if(![favoritesTableData containsObject:selectedContact])
            [favoritesTableData addObject:selectedContact];
    }
}

@end
