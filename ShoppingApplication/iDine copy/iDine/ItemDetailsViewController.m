//
//  ItemDetailsViewController.m
//  iDine
//
//  Created by macOS Catalina on 03/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "ItemDetailsViewController.h"

@interface ItemDetailsViewController ()

@end

@implementation ItemDetailsViewController

@synthesize itemImage, itemDescription, item;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    NSString *imageName= [[item.menuname stringByReplacingOccurrencesOfString:@" " withString:@"-"] lowercaseString];
    self.itemImage.image = [UIImage imageNamed:imageName];
    self.itemDescription.text = item.description;
}

@end
