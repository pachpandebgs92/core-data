//
//  EmployeeDataViewController.h
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 02/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "EmployeeDataPushViewController.h"

@interface EmployeeDataViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSArray *arrEmployeeData;
}
@property (weak, nonatomic) IBOutlet UITableView *EmployeeNameTableView;

@end
