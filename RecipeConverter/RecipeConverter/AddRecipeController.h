//
//  AddRecipeController.h
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRecipeController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *recipeName;
@property (weak, nonatomic) IBOutlet UITextField *ingredientTv;

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end
