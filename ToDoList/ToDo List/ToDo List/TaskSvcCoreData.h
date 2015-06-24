//
// Created by Davey McNight on 6/20/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskSvc.h"

@interface TaskSvcCoreData : NSObject  <TaskSvc>



-(Task *)createManagedTask;
-(Task *)saveTask:(Task *)task;





@end