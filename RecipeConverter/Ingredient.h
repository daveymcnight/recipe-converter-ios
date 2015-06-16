//
//  Ingredient.h
//  RecipeConverter
//
//  Created by Davey McNight on 6/15/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Recipe *recipe;

@end
