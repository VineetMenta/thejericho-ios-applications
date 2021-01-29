//
//  ViewController.m
//  LoginApplication
//
//  Created by macOS Catalina on 07/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondVC.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize userName,password;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (IBAction)loginBtn:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondVC *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
