//
//  ViewController.h
//  iDine
//
//  Created by macOS Catalina on 27/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *menutableView;
@property (nonatomic, retain) NSMutableArray *menuSectionArray;


@end

