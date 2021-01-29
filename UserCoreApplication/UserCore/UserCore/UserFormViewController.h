//
//  UserFormViewController.h
//  UserCore
//
//  Created by macOS Catalina on 04/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserFormViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate>
   @property IBOutlet  UITextField *firstNameTxtField;
   @property IBOutlet  UITextField *lastNameTxtField;
   @property IBOutlet  UITextField *emailTxtField;
   @property IBOutlet  UITextField *pwdTxtField;
   @property IBOutlet  UITextField *confirmTxtField;
   @property IBOutlet  UITextField *genderTxtField;
   @property IBOutlet  UITextField *dobTxtField;
   @property IBOutlet  UITextField *phoneNumberTxtField;
   @property IBOutlet  UITextField *countryTxtField;
   @property IBOutlet UIDatePicker *datePicker;
   @property IBOutlet UIPickerView *pickerView;
   @property IBOutlet  UIButton *submitButton;
   @property IBOutlet  UIButton *cancelButton;
   @property (weak, nonatomic) IBOutlet UIButton *btnGallery;
   @property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@property(nonatomic,strong) User *userObj;

@end
