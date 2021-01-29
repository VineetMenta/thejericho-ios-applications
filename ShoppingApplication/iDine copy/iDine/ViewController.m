//
//  ViewController.m
//  iDine
//
//  Created by macOS Catalina on 27/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "ViewController.h"
#import "MenuItem.h"
#import "MenuSection.h"
#import "Order.h"
#import "MenuItemCell.h"
#import "ItemDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize menuSectionArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    if(menuSectionArray==nil){
        menuSectionArray = [[NSMutableArray alloc] init];
        [self getAllData];
    }
    NSLog(@"%@", menuSectionArray);
    // Do any additional setup after loading the view.
}

-(void)getAllData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"menu" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]; // json parseing
    NSLog(@"==== array === %@", array);
    for (int i = 0; i < array.count; i++){
       NSDictionary *menuDict = array[i];
       MenuSection *menu = [[MenuSection alloc] init];
       menu.menuID =  [menuDict valueForKey:@"id"];
       menu.menuName = [menuDict valueForKey:@"name"];
       menu.items = [[NSMutableArray alloc] init];
       NSArray *local_menuItemArray =  [menuDict valueForKey:@"items"];
        
        for (int j = 0; j < local_menuItemArray.count; j++){
            NSDictionary *itemDict = local_menuItemArray[j];
            MenuItem *menuitem = [[MenuItem alloc] init];
            menuitem.menuItemID = [itemDict valueForKey:@"id"];
            menuitem.menuname = [itemDict valueForKey:@"name"];
            menuitem.quantity = 0;
            menuitem.price = [[itemDict valueForKey:@"price"] intValue];
            menuitem.photoCredit = [itemDict valueForKey:@"photoCredit"];
            menuitem.description = [itemDict valueForKey:@"description"];
            [menu.items addObject:menuitem];
        }
        [menuSectionArray addObject:menu];
    }
    [self menutableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *menuCell = @"MenuItemCell";
    MenuItemCell *cell = (MenuItemCell *)[tableView dequeueReusableCellWithIdentifier:menuCell];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuItemCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    MenuSection *menu = [menuSectionArray objectAtIndex:indexPath.section];
    MenuItem *item = [menu.items objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.nameLabel.text = item.menuname;
    NSString *imageName= [[[item.menuname stringByReplacingOccurrencesOfString:@" " withString:@"-"] stringByAppendingString:@"-thumb"] lowercaseString];
    cell.thumbnailImage.image = [UIImage imageNamed:imageName];
    cell.itemCountLabel.text = [NSString stringWithFormat:@"%d", item.quantity];
    cell.priceLabel.text = [NSString stringWithFormat:@"$%d", item.price];
    cell.addButton.tag = (1000 * (indexPath.section + 1)) + indexPath.row;
    [cell.addButton addTarget:self action:@selector(clickedAddButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.removeButton.tag = (1000 * (indexPath.section + 1)) + indexPath.row;
    [cell.removeButton addTarget:self action:@selector(clickedRemoveButton:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return menuSectionArray.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MenuSection *menu = [menuSectionArray objectAtIndex:section];
    return menu.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[menuSectionArray objectAtIndex:section] menuName];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuSection *menu = [menuSectionArray objectAtIndex:indexPath.section];
    MenuItem *item = [menu.items objectAtIndex:indexPath.row];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ItemDetailsViewController *itemDetails = [storyBoard instantiateViewControllerWithIdentifier:@"ItemDetailsViewController"];
    itemDetails.item = item;
    [self.navigationController pushViewController:itemDetails animated:true];
}

- (void)clickedAddButton:(UIButton *)sender{
    NSInteger section = (sender.tag/1000) - 1;
    NSInteger row = sender.tag % 1000;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    MenuSection *menu = [menuSectionArray objectAtIndex:indexPath.section];
    MenuItem *item = [menu.items objectAtIndex:indexPath.row];
    item.quantity = item.quantity + 1;
    [menuSectionArray replaceObjectAtIndex:indexPath.section withObject:menu];
    [Order addItem:(item)];
    NSArray *indArr = [[NSArray alloc] initWithObjects:(NSIndexPath*)indexPath, nil];
    [self.menutableView reloadRowsAtIndexPaths:indArr withRowAnimation:UITableViewRowAnimationNone];
}

- (void)clickedRemoveButton:(UIButton *)sender{
    NSInteger section = (sender.tag/1000) - 1;
    NSInteger row = sender.tag % 1000;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    MenuSection *menu = [menuSectionArray objectAtIndex:indexPath.section];
    MenuItem *item = [menu.items objectAtIndex:indexPath.row];
    if(item.quantity > 0)
       item.quantity = item.quantity - 1;
    [menuSectionArray replaceObjectAtIndex:indexPath.section withObject:menu];
    [Order removeItem:(item)];
    NSArray *indArr = [[NSArray alloc] initWithObjects:(NSIndexPath*)indexPath, nil];
    [self.menutableView reloadRowsAtIndexPaths:indArr withRowAnimation:UITableViewRowAnimationNone];
}

@end
