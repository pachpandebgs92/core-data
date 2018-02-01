//
//  AppDelegate.h
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 01/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

