//
//  ContactDetailViewController.m
//  ToDo List
//
//  Created by Davey McNight on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ContactDetailViewController.h"
#import "ContactSvcCoreData.h"
#import "Contact.h"

@implementation ContactDetailViewController

ContactSvcCoreData *taskSvcCoreData2;



- (void)viewDidLoad {
    [super viewDidLoad];
    _projectField.text = _parentTask.name;
    taskSvcCoreData2 = [[ContactSvcCoreData alloc] init];

   
   

}


- (IBAction)back:(id)sender {
    _parentTask.name = _projectField.text;
    [taskSvcCoreData2 saveContact:_parentTask];

}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}



@end
