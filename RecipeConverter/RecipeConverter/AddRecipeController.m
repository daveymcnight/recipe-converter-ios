//
//  AddRecipeController.m
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "AddRecipeController.h"


#import "Recipe.h"
#import "RecipeSvcCoreData.h"

@interface AddRecipeController ()

@end


@implementation AddRecipeController

//NSMutableArray *ingredients;
RecipeSvcCoreData *recipeSvcCoreData = nil;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    recipeSvcCoreData = [[RecipeSvcCoreData alloc] init];
//    ingredients = [[NSMutableArray alloc] init];
   self.tableView.allowsMultipleSelectionDuringEditing = NO;
}
- (IBAction)saveRec:(id)sender {
    Recipe *recipe = [[Recipe alloc]init];
    recipe.name = self.recipeName.text;
   // NSMutableArray *ingredientArray = [[NSMutableArray alloc]init];
//    recipe.ingredients = ingredientArray;
    //
    [recipeSvcCoreData createRecipe:recipe];
    [self performSegueWithIdentifier:@"back" sender:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addIngredient:(id)sender {
//    Ingredient *ingredient = [[Ingredient alloc] init];
//    ingredient.name = _ingredientTv.text;
//    [ingredients addObject: ingredient];
//       [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [ingredients count];
    return 0;
}

//INGREDIENTS is the second use case

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *simpleTableIdentifier= @"SimpleTableItem";
//    UITableViewCell*cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    Ingredient *ingredient = [ingredients  objectAtIndex:indexPath.row];
//    cell.textLabel.text = ingredient.name;
//    return cell;
    return nil;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//            [ingredients removeObjectAtIndex:indexPath.row];
//            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//            [self.tableView reloadData];
//    }
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
