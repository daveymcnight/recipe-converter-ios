//
//  ViewController.m
//  ToDo List
//
//  Created by Davey McNight on 6/20/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"
#import "TaskSvcCoreData.h"
#import "SubTaskViewController.h"

@interface ViewController ()

@end

@implementation ViewController

TaskSvcCoreData *taskSvcCoreData = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    taskSvcCoreData = [[TaskSvcCoreData alloc] init];
     _addTaskField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Task *task = [[taskSvcCoreData retrieveAllTasks]objectAtIndex:indexPath.row];
        [taskSvcCoreData deleteTask:task];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        //NSLog(@"%d", (int)indexPath.row);
    Task *task = [[taskSvcCoreData retrieveAllTasks]objectAtIndex:indexPath.row];
    SubTaskViewController *subTaskViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"subTaskViewController"];
    subTaskViewController.parentTask = task;
    [self presentViewController:subTaskViewController animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [taskSvcCoreData.retrieveAllTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier= @"task";
    UITableViewCell*cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    Task *task = [[taskSvcCoreData retrieveAllTasks]objectAtIndex:indexPath.row];
    cell.textLabel.text = task.name;
    return cell;
}

- (IBAction)addTask:(id)sender {
    if(![_addTaskField.text length] == 0) {
        Task *task = [taskSvcCoreData createManagedTask];
        task.name = self.addTaskField.text;
        [taskSvcCoreData createTask:task];
        _addTaskField.text = @"";
        [self.tableView reloadData];
        [self.view endEditing:YES];
    }else{
        NSLog(@"Empty String");
    }

}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
}

@end
