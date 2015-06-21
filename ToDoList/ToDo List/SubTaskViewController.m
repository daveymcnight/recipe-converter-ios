//
//  SubTaskViewController.m
//  ToDo List
//
//  Created by Davey McNight on 6/21/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "SubTaskViewController.h"

@implementation SubTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _projectField.text = _parentTask.name;
}


@end
