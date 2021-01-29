//
//  ViewController.h
//  CustomFavoriteFriends
//
//  Created by macOS Catalina on 25/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *FriendsSegment;
@property (weak, nonatomic) IBOutlet UITableView *AllFriendsTableView;

- (IBAction)switchSegment:(id)sender;

@end

