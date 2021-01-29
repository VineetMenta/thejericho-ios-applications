//
//  AppDelegate.h
//  iDine
//
//  Created by macOS Catalina on 27/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

