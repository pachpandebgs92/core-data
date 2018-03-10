//
//  EmployeeDataPushViewController.m
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 02/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import "EmployeeDataPushViewController.h"

@interface EmployeeDataPushViewController ()

@end

@implementation EmployeeDataPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lblName.text=[_managedObject valueForKey:@"empname"];
    _lblDob.text=[NSString stringWithFormat:@"%@",[_managedObject valueForKey:@"empdob"] ];
    _lblDept.text=[_managedObject valueForKey:@"empdepartment"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
