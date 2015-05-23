//
//  RecipeSvc.h
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RecipeSvc <NSObject>

-(Recipe *) createRecipe: (Recipe *) Recipe;
-(NSMutableArray*) retrieveAllRecipes;
-(Recipe *) updateRecipe: (Recipe *) Recipe;
-(Recipe *) deleteRecipe: (Recipe *) Recipe;

@end
