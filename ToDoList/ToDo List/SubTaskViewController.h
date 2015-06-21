//
//  SubTaskViewController.h
//  ToDo List
//
//  Created by Davey McNight on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface SubTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *projectField;

@property (weak, nonatomic) Task *parentTask;



@end
