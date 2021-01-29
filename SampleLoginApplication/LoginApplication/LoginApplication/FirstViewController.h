//
//  ViewController.h
//  LoginApplication
//
//  Created by macOS Catalina on 07/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITextFieldDelegate>
{
}
- (IBAction)loginBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@end

