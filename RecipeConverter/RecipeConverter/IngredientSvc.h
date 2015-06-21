//
// Created by Davey McNight on 6/20/15.
// Copyright (c) 2015 msse650. All rights reserved.
//
#import "Ingredient.h""
#import <Foundation/Foundation.h>

@protocol IngredientSvc <NSObject>

-(Ingredient *) createIngredient: (Ingredient *) ingredient;
-(NSArray*) retrieveIngredient;
-(Ingredient *) updateIngredient: (Ingredient *) ingredient;
-(Ingredient *) deleteIngredient: (Ingredient *) ingredient;
@end