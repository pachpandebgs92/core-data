//
//  ViewController.m
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 01/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Department";
}

-(NSManagedObjectContext *)getManagedObjectContext{
    AppDelegate *deligate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=deligate.persistentContainer.viewContext;
    return context;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnActionDepatmentDataSave:(id)sender {
    if ([_txtDepartmentName.text isEqualToString:@""]) {
        [self addAlert:@"Please Enter Name"];
    }else if ([_txtDepartmentID.text isEqualToString:@""]){
        [self addAlert:@"Please Enter ID"];
    }else{
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Department" inManagedObjectContext:[self getManagedObjectContext]];
        NSManagedObject *managedObject=[[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:[self getManagedObjectContext]];
        [managedObject setValue:_txtDepartmentName.text forKey: @"departmentname"];
        [managedObject setValue:[NSNumber numberWithInteger:[_txtDepartmentID.text intValue]] forKey:@"departmentid"];
        NSError *error;
        [[self getManagedObjectContext] save:&error];
        
        _txtDepartmentName.text=@"";
        _txtDepartmentID.text=@"";
    }
}
-(void)addAlert:(NSString *)message{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Hi" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *ok) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
