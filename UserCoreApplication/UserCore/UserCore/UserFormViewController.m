//
//  UserFormViewController.m
//  UserCore
//
//  Created by macOS Catalina on 04/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "UserFormViewController.h"
#import "ViewController.h"
#import "User.h"
#import "CoreDataUtilities.h"

@interface UserFormViewController (){
NSMutableArray *countryArray;
UIImagePickerController *ipc;
}
@end

@implementation UserFormViewController

@synthesize firstNameTxtField, lastNameTxtField, emailTxtField, genderTxtField, phoneNumberTxtField,confirmTxtField, dobTxtField, countryTxtField, pwdTxtField, submitButton, datePicker, pickerView, profilePic, userObj;
BOOL editMode;

- (void)viewDidLoad {
    [super viewDidLoad];
    if(userObj!=nil){
        editMode=YES;
        [self setData];
    }
    countryArray = [[NSMutableArray alloc] initWithObjects:@"India",@"USA",@"Canada",@"Srilanka",@"China",@"Singapore",@"Dubai",@"South Africa",@"Austraila", nil];
    [self loginForm];
}

-(void)loginForm {
    firstNameTxtField.delegate=self;
    lastNameTxtField.delegate=self;
    emailTxtField.delegate=self;
    genderTxtField.delegate=self;
    phoneNumberTxtField.delegate=self;
    confirmTxtField.delegate=self;
    dobTxtField.delegate=self;
    countryTxtField.delegate=self;
    pwdTxtField.delegate = self;
    [submitButton addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.pickerView.dataSource=self;
    self.pickerView.delegate=self;
    datePicker.hidden=true;
    pickerView.hidden=true;
}

-(void)setData{
    firstNameTxtField.text=userObj.firstName;
    lastNameTxtField.text=userObj.lastName;
    emailTxtField.text=userObj.emailId;
    [emailTxtField setUserInteractionEnabled:NO];
    genderTxtField.text=userObj.gender;
    phoneNumberTxtField.text=userObj.phoneNumber;
    confirmTxtField.text=userObj.password;
    dobTxtField.text=userObj.dateOfBirth;
    countryTxtField.text=userObj.country;
    pwdTxtField.text = userObj.password;
    profilePic.image =[UIImage imageWithData:userObj.profilePic];
}

-(void)startAnimation:(int)ycordinate {
   
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
        CGRect rect= self.view.frame; // x:0,y:0,width:320,height:568
        switch (ycordinate) {
            case 6:
                rect.origin.y = -50;
                break;
            case 7:
                rect.origin.y = -75;
                break;
            case 8:
                rect.origin.y = -100;
                break;
            default:
                break;
        }
           self.view.frame = rect;
      } completion:^(BOOL finished) {
          //code for completion
      }];
}
-(void)stopAnimation {
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
         CGRect rect= self.view.frame;
         rect.origin.y = 0;
         self.view.frame = rect;
    } completion:^(BOOL finished) {
        //code for completion
    }];
}

-(void) dateTextField:(id)sender
{
     
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSLog(@"=== picker.date ==== %@", datePicker.date);
    NSDate *eventDate = datePicker.date;
    
    [dateFormat setDateFormat:@"EEEE, MMM d, yyyy"];

    NSString *dateString = [dateFormat stringFromDate:eventDate];
    dobTxtField.text = [NSString stringWithFormat:@"%@",dateString];
}

// MARK: -  textfield delegate method

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"== textFieldDidBeginEditing ===");
    [datePicker setHidden:true];
    [pickerView setHidden:true];
    [self startAnimation:(int)textField.tag];
    if (textField == dobTxtField){
        [datePicker setBackgroundColor:[UIColor systemGray2Color]];
        [datePicker setHidden:false];
        [datePicker setDate:[NSDate date]]; // today's date
        datePicker.datePickerMode = UIDatePickerModeDate;
        [datePicker setMaximumDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
        [datePicker inputView];
    }
    else if(textField == countryTxtField){
        [pickerView setHidden:false];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"== textFieldDidBeginEditing ===");

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self stopAnimation];
    [self.view endEditing:true];
        return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return  true;
}
 

#pragma mark - Pickerview delegate methods

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
        countryTxtField.text = countryArray[row];
    }
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}
 
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
        return countryArray[row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return countryArray.count;
}


-(IBAction)submitBtnClicked:(id)sender{
    [self.view endEditing:true];
    [self addDataToCD];
   // UIStoryboard *storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   // ViewController *firstVc = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController  popViewControllerAnimated:true];
}

-(IBAction)editPhotoBtnClicked:(id)sender{
    ipc= [[UIImagePickerController alloc] init];
    ipc.delegate=self;
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark - ImagePickerController Delegate
 
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    profilePic.layer.cornerRadius = 20;
    profilePic.clipsToBounds = YES;
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [profilePic setImage:image];
}
 
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)addDataToCD{
    User *user = [[User alloc] init];
    CoreDataUtilities *core = [[CoreDataUtilities alloc] init];
    user.firstName=self.firstNameTxtField.text;
    user.lastName=self.lastNameTxtField.text;
    user.country=self.countryTxtField.text;
    user.emailId=self.emailTxtField.text;
    user.dateOfBirth=self.dobTxtField.text;
    user.gender=self.genderTxtField.text;
    user.password=self.pwdTxtField.text;
    user.phoneNumber=self.phoneNumberTxtField.text;
    user.profilePic=UIImageJPEGRepresentation(self.profilePic.image, 0.0);
    if(editMode){
        [core editUser:user];
    }else{
      [core addUser:user];
    }
}
@end
