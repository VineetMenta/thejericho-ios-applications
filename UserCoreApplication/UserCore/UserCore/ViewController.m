//
//  ViewController.m
//  UserCore
//
//  Created by macOS Catalina on 03/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "ViewController.h"
#import "UserFormViewController.h"
#import "UserCell.h"
#import "User.h"
#import "CoreDataUtilities.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView;
NSMutableArray *dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc] init];
    [tableView registerNib:[UINib nibWithNibName:@"UserCell" bundle:nil] forCellReuseIdentifier:@"UserCell"];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [self getUsersList];
    [self.tableView reloadData];
}

-(void)getUsersList{
    CoreDataUtilities *core = [[CoreDataUtilities alloc] init];
    dataArray = [core getUsers]; // Array users Array
    NSLog(@"=== dataArray.count === %lu", (unsigned long)dataArray.count);
}

#pragma mark - TableView Delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifierTwo = @"UserCell";
    UserCell *cell = (UserCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
    if (cell == nil) {
        cell =  [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserCell"];
    }
    User *userObj=  [dataArray objectAtIndex:indexPath.row];
    cell.emailLbl.text = userObj.emailId;
    cell.usernameLbl.text = userObj.firstName;
    cell.profilePic.image = [UIImage imageWithData:userObj.profilePic];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserFormViewController *secondVc = [storyBoard instantiateViewControllerWithIdentifier:@"UserFormViewController"];
    secondVc.userObj = (User *)[dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:secondVc animated:true];
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(IBAction)addBtnClicked:(id)sender{
    UIStoryboard *storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserFormViewController *secondVc = [storyBoard instantiateViewControllerWithIdentifier:@"UserFormViewController"];
    [self.navigationController  pushViewController:secondVc animated:true];
}

@end
