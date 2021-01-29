//
//  User.h
//  UserCore
//
//  Created by macOS Catalina on 11/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *emailId;
@property(nonatomic, retain) NSString *password;
@property(nonatomic, retain) NSString *dateOfBirth;
@property(nonatomic, retain) NSString *phoneNumber;
@property(nonatomic, retain) NSString *country;
@property(nonatomic, retain) NSString *gender;
@property(nonatomic, retain) NSData *profilePic;

@end

NS_ASSUME_NONNULL_END
