//
// Created by Davey McNight on 6/20/15.
// Copyright (c) 2015 msse650. All rights reserved.
//

#import "IngredientSvcCoreData.h"


@implementation IngredientSvcCoreData


NSManagedObjectModel *model = nil;
NSPersistentStoreCoordinator *psc= nil;
NSManagedObjectContext *moc= nil;


-(void) initializeCoreData {
    // initialize (load) the schema model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RecipeModel" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    // initialize the persistent store coordinator with the model
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager]
            URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"RecipeModel.sqlite"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    if ([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL: storeURL options: nil error:&error]) {
        // initialize the managed object context
        moc= [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    } else{
        NSLog(@"initializeCoreDataFAILED with error: %@", error);
    }
}

-(id) init{
    if(self = [super init]){
        [self initializeCoreData];
        return self;
    }
    return nil;
}


- (Ingredient *)createIngredient:(Ingredient *)ingredient {
    return nil;
}

- (NSArray *)retrieveIngredient {
    return nil;
}

- (Ingredient *)updateIngredient:(Ingredient *)ingredient {
    return nil;
}

- (Ingredient *)deleteIngredient:(Ingredient *)ingredient {
    return nil;
}




@end