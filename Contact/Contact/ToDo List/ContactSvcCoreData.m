//
// Created by Davey McNight on 6/20/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import "ContactSvcCoreData.h"


@implementation ContactSvcCoreData

NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc= nil;

NSManagedObjectContext *moc= nil;


+ (void)initialize {
    // initialize (load) the schema model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ToDo_List" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    // initialize the persistent store coordinator with the model
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager]
            URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"ToDo_List.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL: storeURL options: nil error:&error]) {
        // initialize the managed object context
        moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    } else{
        NSLog(@"initializeCoreDataFAILED with error: %@", error);
    }
}

-(id) init{
    if(self = [super init]){
//        [self initializeCoreData];
        return self;
    }
    return nil;
}


- (Contact *)createContact:(Contact *)contact{
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"ERROR RECIPE CREATE");
    }
    return contact;

}

- (Contact *)createManagedContact{
    Contact *managedcontact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:moc];
    return managedcontact;
}

- (NSArray *)retrieveAllContacts {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedOnjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedOnjects;
}

- (Contact *)updateContact:(Contact *)contact {
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"ERROR contact CREATE");
    }
    return contact;
}

- (Contact *)deleteContact:(Contact *)contact{
    [moc deleteObject:contact];
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"ERROR Contact Delete");
    }

    return contact;
}

- (Contact *)saveContact:(Contact *)contact {
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"ERROR contact Save");
    }
    return contact;
}



@end