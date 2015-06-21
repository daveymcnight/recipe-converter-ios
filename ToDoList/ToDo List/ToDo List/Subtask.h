//
//  Subtask.h
//  ToDo List
//
//  Created by Davey McNight on 6/20/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Task;

@interface Subtask : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Task *task;

@end
