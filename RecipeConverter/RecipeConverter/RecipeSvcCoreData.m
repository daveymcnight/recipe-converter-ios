//
//  RecipeSvcCoreData.m
//  RecipeConverter
//
//  Created by Davey McNight on 6/14/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "RecipeSvcCoreData.h"

@implementation RecipeSvcCoreData

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


- (Recipe *)createRecipe:(Recipe *)recipe {
    Recipe *managedRecipe = [self createManagedRecipe];
    managedRecipe.name = recipe.name;
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"ERROR RECIPE CREATE");
    }
    return managedRecipe;
}

- (NSArray *)retrieveAllRecipes {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
            [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedOnjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedOnjects;

}

- (Recipe *)updateRecipe:(Recipe *)recipe {
    return recipe;
}

- (Recipe *)deleteRecipe:(Recipe *)recipe {
    return recipe;
}


-(Recipe *)createManagedRecipe{
    Recipe *recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe"
                                                   inManagedObjectContext:moc];
    return recipe;
}



@end
