//
//  UserDataAppDelegate.h
//  UserCore
//
//  Created by macOS Catalina on 11/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayViewController.h"
 
@interface UserDataAppDelegate : UIResponder <UIApplicationDelegate>
 
@property (strong, nonatomic) UIWindow *window;
 
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
 
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) DisplayViewController *displayViewController;
 
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
 
@end
