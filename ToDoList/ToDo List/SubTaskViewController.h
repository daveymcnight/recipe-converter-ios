//
//  SubTaskViewController.h
//  ToDo List
//
//  Created by Davey McNight on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface SubTaskViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *projectField;
@property (strong) Task *parentTask;
@property (weak, nonatomic) IBOutlet UITextField *subTaskField;
@property (weak, nonatomic) IBOutlet UITableView *subTaskTableView;


@end
