//
//  CoreDataUtilities.h
//  UserCore
//
//  Created by macOS Catalina on 11/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Users+CoreDataClass.h"
#import "User.h"

@interface CoreDataUtilities : NSObject
-(void)addUser:(User *)addUser;
-(void)editUser:(User *)editUser;
-(NSMutableArray*)getUsers;
@end
