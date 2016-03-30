//
// Created by Davey McNight on 6/21/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import "SubTaskSvcCoreData.h"
#import "TaskSvcCoreData.h"

extern NSManagedObjectModel *model;
extern NSPersistentStoreCoordinator *psc;
extern NSManagedObjectContext *moc;

@implementation SubTaskSvcCoreData

-(id) init{
    if(self = [super init]){
        return self;
    }
    return nil;
}

- (Subtask *)createSubTask:(Subtask *)subtask {
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"ERROR RECIPE CREATE");
    }
    return subtask;

}

- (NSArray *)retrieveAllSubTasks {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Subtask" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedOnjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedOnjects;
}

- (Subtask *)updateSubTask:(Subtask *)subtask {
    return nil;
}

- (Subtask *)deleteSubTask:(Subtask *)subtask {
    return nil;
}

- (Subtask *)createManagedSubTask {
    Subtask *managedSubTask = [NSEntityDescription insertNewObjectForEntityForName:@"Subtask" inManagedObjectContext:moc];
    return managedSubTask;
}


@end