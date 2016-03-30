//
//  SubTaskViewController.m
//  ToDo List
//
//  Created by Davey McNight on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "SubTaskViewController.h"
#import "SubTaskSvcCoreData.h"
#import "TaskSvcCoreData.h"
#import "Subtask.h"
#import "Task.h"

@implementation SubTaskViewController

TaskSvcCoreData *taskSvcCoreData2;
SubTaskSvcCoreData *subTaskSvcCoreData;
NSArray *subTasksArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    _projectField.text = _parentTask.name;
    taskSvcCoreData2 = [[TaskSvcCoreData alloc] init];
    subTaskSvcCoreData = [[SubTaskSvcCoreData alloc] init];
    subTasksArray = [_parentTask.tasks allObjects];
    _subTaskField.autocapitalizationType = UITextAutocapitalizationTypeSentences;

}


- (IBAction)back:(id)sender {
    _parentTask.name = _projectField.text;
    [taskSvcCoreData2 saveTask:_parentTask];

}

- (IBAction)addSubTask:(id)sender {
    if(![_subTaskField.text length] == 0){
        Subtask *subtask = [subTaskSvcCoreData createManagedSubTask];
        subtask.name = _subTaskField.text;
        [subTaskSvcCoreData createSubTask:subtask];
        [_parentTask addTasksObject:subtask];
        [taskSvcCoreData2 saveTask:_parentTask];
        subTasksArray = [_parentTask.tasks allObjects];
        _subTaskField.text = @"";
        [self.subTaskTableView reloadData];
    } else{
        NSLog(@"Empty String");
    }


}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *managedObject = [subTasksArray objectAtIndex:indexPath.row];
        [_parentTask removeTasksObject:(Subtask *)managedObject];
        [subTaskSvcCoreData deleteSubTask:(Subtask *)managedObject];
        subTasksArray = [_parentTask.tasks allObjects];
        [taskSvcCoreData2 saveTask:_parentTask];
        [self.subTaskTableView reloadData];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_parentTask.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier= @"subtask";
    UITableViewCell*cell = [self.subTaskTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    Subtask *subtask = [subTasksArray objectAtIndex:indexPath.row];
    cell.textLabel.text = subtask.name;
    return cell;
}


@end
