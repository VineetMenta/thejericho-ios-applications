//
//  ViewController.h
//  FavoriteFriends
//
//  Created by macOS Catalina on 20/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *FriendsSegment;
@property (weak, nonatomic) IBOutlet UITableView *AllFriendsTableView;

- (IBAction)AddToFav:(id)sender;
- (IBAction)switchSegment:(id)sender;

@end

