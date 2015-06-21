//
//  TaskSvc.h
//  ToDo List
//
//  Created by Davey McNight on 6/20/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol TaskSvc <NSObject>

-(Task *) createTask: (Task *)task;
-(NSArray *) retrieveAllTasks;
-(Task *) updateTask: (Task *)task;
-(Task *) deleteTask: (Task *)task;


@end
