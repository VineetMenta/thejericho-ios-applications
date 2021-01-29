//
//  ItemDetailsViewController.h
//  iDine
//
//  Created by macOS Catalina on 03/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@interface ItemDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;

@property (nonatomic) MenuItem *item;

@end
