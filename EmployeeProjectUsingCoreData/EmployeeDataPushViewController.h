//
//  EmployeeDataPushViewController.h
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 02/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface EmployeeDataPushViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDob;
@property (weak, nonatomic) IBOutlet UILabel *lblDept;
@property (strong,nonatomic) NSManagedObject *managedObject;
@end
