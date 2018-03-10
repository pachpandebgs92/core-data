//
//  EmployeeDataViewController.m
//  EmployeeProjectUsingCoreData
//
//  Created by Bhagyashri Pachpande on 02/02/18.
//  Copyright © 2018 Bhagyashri Pachpande. All rights reserved.
//

#import "EmployeeDataViewController.h"

@interface EmployeeDataViewController ()

@end

@implementation EmployeeDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSManagedObjectContext *)getManagedObjectContext{
    AppDelegate *deligate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=deligate.persistentContainer.viewContext;
    return context;
}

-(void)viewWillAppear:(BOOL)animated{
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    arrEmployeeData=[[self getManagedObjectContext] executeFetchRequest:request error:nil];
    NSLog(@"%@",arrEmployeeData);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrEmployeeData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[[arrEmployeeData objectAtIndex:indexPath.row] valueForKey:@"empname"];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        NSMutableArray *arrEmpData=[arrEmployeeData mutableCopy];
        [arrEmpData removeObjectAtIndex:indexPath.row];
        arrEmployeeData=[arrEmpData copy];
        [tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EmployeeDataPushViewController *dataPushVC=[self.storyboard instantiateViewControllerWithIdentifier:@"EmployeeDataPushViewController"];
    dataPushVC.managedObject=[arrEmployeeData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:dataPushVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
