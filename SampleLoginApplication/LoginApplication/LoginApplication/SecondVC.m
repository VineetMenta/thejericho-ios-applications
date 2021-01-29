//
//  ViewController.m
//  LoginApplication
//
//  Created by macOS Catalina on 07/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

@synthesize welcomeMsg;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)BtnClicked:(UIButton *)sender{
    UIButton *btn = (UIButton*)[self.view viewWithTag:sender.tag];
    welcomeMsg.text=[NSString stringWithFormat:@"Clicked Button %i", btn.tag];
}


@end
