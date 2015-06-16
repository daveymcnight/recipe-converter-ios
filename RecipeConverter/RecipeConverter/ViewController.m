//
//  ViewController.m
//  RecipeConverter
//
//  Created by Davey McNight on 5/22/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "ViewController.h"
#import "RecipeSvcCoreData.h"
#import "Recipe.h"
@interface ViewController ()

@end



@implementation ViewController

//RecipeSvcArchive* recipeSvc2 = nil;
RecipeSvcCoreData *recipeSvcCoreData2 = nil;
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // recipeSvc2 = [[RecipeSvcArchive alloc] init];
  recipeSvcCoreData2 = [[RecipeSvcCoreData alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [recipeSvc2.retrieveAllRecipes count];
    return [recipeSvcCoreData2.retrieveAllRecipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier= @"SimpleTableItem";
    UITableViewCell*cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    Recipe *recipe = [[recipeSvcCoreData2 retrieveAllRecipes]objectAtIndex:indexPath.row];
    
    cell.textLabel.text = recipe.name;
    return cell;
}



@end
