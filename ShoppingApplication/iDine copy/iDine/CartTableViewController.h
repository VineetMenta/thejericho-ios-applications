//
//  CartTableViewController.h
//  iDine
//
//  Created by macOS Catalina on 03/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *cartTableView;
@property (weak, nonatomic) IBOutlet UILabel *totalOfOrders;

@property (nonatomic) NSMutableArray *items;

@end
