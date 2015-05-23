//
//  AddRecipeController.m
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "AddRecipeController.h"
#import "Recipe.h"
#import "RecipeSvcCache.h"
#import "Ingredient.h"

@interface AddRecipeController ()

@end


@implementation AddRecipeController

NSMutableArray *ingredients;
Recipe *recipe = nil;
RecipeSvcCache *recipeSvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    recipeSvc = [[RecipeSvcCache alloc] init];
    ingredients = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addIngredient:(id)sender {
    Ingredient *ingredient = [[Ingredient alloc] init];
    ingredient.description = _ingredientTv.text;
    [ingredients addObject: ingredient];
}
- (IBAction)saveRecipe:(id)sender {
  recipe = [[Recipe alloc]init];
  recipe.name = _recipeName.text;

//    [[NSUserDefaults standardUserDefaults] setObject recipe forKey:@"myArray"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
