//
//  ViewController.h
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 01/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "EmployeeViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtDepartmentName;
@property (weak, nonatomic) IBOutlet UITextField *txtDepartmentID;
- (IBAction)btnActionDepatmentDataSave:(id)sender;


@end

