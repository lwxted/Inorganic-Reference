//
//  AppDelegate.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-2.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) UIImage *starred;
@property (strong, nonatomic) UIImage *plain;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
