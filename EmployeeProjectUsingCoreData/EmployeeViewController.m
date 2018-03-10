//
//  EmployeeViewController.m
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 02/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Employee";
    [self addPickerViewOnTextfieldEmployeeDepartment];
}

-(void)addPickerViewOnTextfieldEmployeeDepartment{
    pickerView=[[UIPickerView alloc] init];
    self.txtEmployeeDepartment.inputView=pickerView;
    pickerView.delegate=self;
    [pickerView setDataSource:self];
    pickerView.showsSelectionIndicator=YES;
}

-(void)viewWillAppear:(BOOL)animated{
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Department"];
    _arrDept=[[self getManagedObjectContext] executeFetchRequest:request error:nil];
    NSLog(@"%@",_arrDept);
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

-(void)addAlert:(NSString *)message{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Hi" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *ok) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)btnActionEmployeeDataSave:(id)sender {
    if ([_txtEmployeeName.text isEqualToString:@""]) {
        [self addAlert:@"Please Enter Name"];
    }else if ([_txtEmployeeBirthdate.text isEqualToString:@""]){
        [self addAlert:@"Please Enter BirthDate"];
    }else if ([_txtEmployeeDepartment.text isEqualToString:@""]){
        [self addAlert:@"Please Enter Department"];
    }else{
        NSEntityDescription *entity=[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:[self getManagedObjectContext]];
        NSManagedObject *managedObject=[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:[self getManagedObjectContext]];
        [managedObject setValue:_txtEmployeeName.text forKey:@"empname"];
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-mm-yy"];
        [managedObject setValue:[dateFormatter dateFromString:_txtEmployeeBirthdate.text] forKey:@"empdob"];
        [managedObject setValue:_txtEmployeeDepartment.text forKey:@"empdepartment"];
        NSError *error;
        [[self getManagedObjectContext] save:&error];
        _txtEmployeeName.text=@"";
        _txtEmployeeBirthdate.text=@"";
        _txtEmployeeDepartment.text=@"";
    }
}

- (IBAction)btnActionEmployeeDataList:(id)sender {
    EmployeeDataViewController *employeeDataVC=[self.storyboard instantiateViewControllerWithIdentifier:@"EmployeeDataViewController"];
    [self.navigationController pushViewController:employeeDataVC animated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _arrDept.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    return [[_arrDept objectAtIndex:row] valueForKey:@"departmentname"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    _txtEmployeeDepartment.text=[[_arrDept objectAtIndex:row] valueForKey:@"departmentname"];
    [[self view] endEditing:YES];
}



@end
