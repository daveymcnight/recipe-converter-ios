//
// Created by Davey McNight on 6/21/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubTaskSvc.h"

@interface SubTaskSvcCoreData : NSObject <SubTaskSvc>

-(Subtask *)createManagedSubTask;

@end