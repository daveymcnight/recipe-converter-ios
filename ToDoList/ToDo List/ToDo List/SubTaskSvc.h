//
// Created by Davey McNight on 6/21/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Subtask.h"
@protocol SubTaskSvc <NSObject>
-(Subtask *) createSubTask: (Subtask *)subtask;
-(NSArray *) retrieveAllSubTasks;
-(Subtask *) updateSubTask: (Subtask *)subtask;
-(Subtask *) deleteSubTask: (Subtask *)subtask;
@end