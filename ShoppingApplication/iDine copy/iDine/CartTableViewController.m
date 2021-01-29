//
//  CartTableViewController.m
//  iDine
//
//  Created by macOS Catalina on 03/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "CartTableViewController.h"
#import "ViewController.h"
#import "MenuItem.h"
#import "MenuSection.h"
#import "Order.h"
#import "MenuItemCell.h"
#import "ItemDetailsViewController.h"

@interface CartTableViewController ()

@end

@implementation CartTableViewController

@synthesize items, totalOfOrders, cartTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    items = Order.cartArray;
    totalOfOrders.text = [NSString stringWithFormat:@"$ %g", [Order totalOfOrders]];
    // Do any additional setup after loading the view.
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *menuCell = @"MenuItemCell";
    MenuItemCell *cell = (MenuItemCell *)[tableView dequeueReusableCellWithIdentifier:menuCell];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuItemCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    MenuItem *item = [items objectAtIndex:indexPath.row];
    cell.nameLabel.text = item.menuname;
    NSString *imageName= [[[item.menuname stringByReplacingOccurrencesOfString:@" " withString:@"-"] stringByAppendingString:@"-thumb"] lowercaseString];
    cell.thumbnailImage.image = [UIImage imageNamed:imageName];
    cell.itemCountLabel.tag = (1000 * (indexPath.section + 1)) + indexPath.row;
    cell.itemCountLabel.text = [NSString stringWithFormat:@"%d", item.quantity];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%d", item.price];
    cell.addButton.enabled=NO;
    cell.removeButton.enabled=NO;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}

@end
