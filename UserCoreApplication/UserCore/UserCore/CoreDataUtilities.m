//
//  CoreDataUtilities.m
//  UserCore
//
//  Created by macOS Catalina on 11/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "CoreDataUtilities.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface CoreDataUtilities ()
@end

@implementation CoreDataUtilities

NSMutableArray *userDataArray;

- (NSManagedObjectContext *)managedObjectContext{
    AppDelegate *appDelegate= (AppDelegate *) [[UIApplication sharedApplication] delegate];
    return appDelegate.persistentContainer.viewContext;
}

-(void)addUser:(User *)addUser{
    NSManagedObjectContext *context = [self managedObjectContext];
    // Create a new managed object
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
    [newUser setValue:addUser.firstName forKey:@"firstName"];
    [newUser setValue:addUser.lastName forKey:@"lastName"];
    [newUser setValue:addUser.emailId forKey:@"emailId"];
    [newUser setValue:addUser.password forKey:@"password"];
    [newUser setValue:addUser.dateOfBirth forKey:@"dateOfBirth"];
    [newUser setValue:addUser.phoneNumber forKey:@"phoneNumber"];
    [newUser setValue:addUser.country forKey:@"country"];
    [newUser setValue:addUser.gender forKey:@"gender"];
    [newUser setValue:addUser.profilePic forKey:@"profilePic"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

-(void)editUser:(User *)editUser{
    userDataArray = [[NSMutableArray alloc] init];
    userDataArray = [self getUsers];
    for(int i=0; i<userDataArray.count; i++){
        User *user=[[User alloc] init];
        user=[userDataArray objectAtIndex:i];
        if([user.emailId isEqualToString:editUser.emailId]){
            [[self managedObjectContext] deleteObject:[userDataArray objectAtIndex:i]];
            NSError *error = nil;
            if (![[self managedObjectContext] save:&error]) {
                NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
                return;
            }
            [self addUser:editUser];
        }
    }
}

-(NSMutableArray*)getUsers{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Users"];
    return [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
}

@end
