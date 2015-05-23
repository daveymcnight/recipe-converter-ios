//
//  RecipeSvcCache.m
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "RecipeSvcCache.h"

@implementation RecipeSvcCache

NSMutableArray *recipes = nil;

- (id)init {
    self = [super init];
    if (self) {
        recipes = [NSMutableArray array];
        return self;
    }
    return nil;
}


- (Recipe *)createRecipe:(Recipe *)recipe {
    recipes = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"recipes"]];
    [recipes addObject:recipe];
    [[NSUserDefaults standardUserDefaults] setObject:recipes forKey:@"recipes"];
    return recipe;
}

- (NSMutableArray *)retrieveAllRecipes {
    recipes = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"recipes"]];
    return recipes;
}

- (Recipe *)updateRecipe:(Recipe *)recipe {
    return nil;
}

- (Recipe *)deleteRecipe:(Recipe *)recipe {
    return nil;
}


@end
