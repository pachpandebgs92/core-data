//
//  EmployeeViewController.h
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 02/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "EmployeeDataViewController.h"

@interface EmployeeViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *pickerView;
}
@property (strong,nonatomic) NSArray *arrDept;
@property (weak, nonatomic) IBOutlet UITextField *txtEmployeeName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmployeeBirthdate;
@property (weak, nonatomic) IBOutlet UITextField *txtEmployeeDepartment;
- (IBAction)btnActionEmployeeDataSave:(id)sender;
- (IBAction)btnActionEmployeeDataList:(id)sender;

@end
