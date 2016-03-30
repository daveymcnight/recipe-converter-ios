//
//  Task.h
//  ToDo List
//
//  Created by Davey McNight on 6/23/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subtask;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface Task (CoreDataGeneratedAccessors)

- (void)addTasksObject:(Subtask *)value;
- (void)removeTasksObject:(Subtask *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end
