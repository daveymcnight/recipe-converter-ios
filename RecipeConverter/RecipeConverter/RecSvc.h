//
//  RecSvc.h
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"

@protocol RecSvc <NSObject>
-(Recipe *) createRecipe: (Recipe *) recipe;
-(NSMutableArray*) retrieveAllRecipes;
-(Recipe *) updateRecipe: (Recipe *) recipe;
-(Recipe *) deleteRecipe: (Recipe *) recipe;


@end
