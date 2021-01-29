//
//  ViewController.h
//  LoginApplication
//
//  Created by macOS Catalina on 07/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondVC : UIViewController
{
}
@property (weak, nonatomic) IBOutlet UILabel *welcomeMsg;
- (IBAction)BtnClicked:(id)sender;
@end
