//
//  ViewController.m
//  ToDo List
//
//  Created by Davey McNight on 6/20/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "ContactSvcCoreData.h"
#import "ContactDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

ContactSvcCoreData *taskSvcCoreData = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    taskSvcCoreData = [[ContactSvcCoreData alloc] init];
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
        Contact *contact = [[taskSvcCoreData retrieveAllContacts]objectAtIndex:indexPath.row];
        [taskSvcCoreData deleteContact:contact];
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        //NSLog(@"%d", (int)indexPath.row);
    Contact *task = [[taskSvcCoreData retrieveAllContacts]objectAtIndex:indexPath.row];
    ContactDetailViewController *subTaskViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"subTaskViewController"];
    subTaskViewController.parentTask = task;
    [self presentViewController:subTaskViewController animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [taskSvcCoreData.retrieveAllContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier= @"task";
    UITableViewCell*cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    Contact *task = [[taskSvcCoreData retrieveAllContacts]objectAtIndex:indexPath.row];
    cell.textLabel.text = task.name;
    return cell;
}

- (IBAction)addTask:(id)sender {
    if(![_addTaskField.text length] == 0) {
        Contact *contact = [taskSvcCoreData createManagedContact];
        contact.name = self.addTaskField.text;
        [taskSvcCoreData createContact:contact];
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
