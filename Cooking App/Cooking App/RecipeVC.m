//
//  RecipeVC.m
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "RecipeVC.h"
#import "RecipeDetailVC.h"
#import "AppDelegate.h"
#import "Recipe.h"

@interface RecipeVC ()

@end

@implementation RecipeVC {
    NSManagedObjectContext *context;
    NSArray *recipes;            // temporary storage for recipes
}

@synthesize myTableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set delegate and datasource of myTableView to self
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    // initialise recipes from Core Data
    recipes = [self fetchAllRecipeData];
}

#pragma mark - tableView delegate methods

/*
 * Returns the number of elements in recipes NSMutableArray.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return recipes.count;
}

/*
 * Inserts recipes in the TableView
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifer = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    Recipe *recipe = [recipes objectAtIndex:indexPath.row];
    
    // recipe image
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.image = [UIImage imageNamed:recipe.thumbnail];
    
    // recipe title
    UILabel *recipeTitle = (UILabel *)[cell viewWithTag:101];
    recipeTitle.text = recipe.title;
    
    // recipe details
    UILabel *recipeDetails = (UILabel *)[cell viewWithTag:102];
    recipeDetails.text = [NSString stringWithFormat:@"Cook Time: %@", recipe.cookTime];
    
    return cell;
}

#pragma mark - segue methods

/*
 * Passes recipe information to the destination view control.
 *
 * NOTE TO PROGRAMMER: 
 * This is where you want to pass objects from this view control 
 * to the desintation view controller.
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        // get selected recipe in tableView
        NSIndexPath *indexPath = [myTableView indexPathForSelectedRow];
        
        // create destination view controller to pass data
        RecipeDetailVC *destVC = segue.destinationViewController;
        
        //
        // Do your passing data here.
        //
        destVC.recipeName = [[recipes objectAtIndex:indexPath.row] title];
    }
}

@end
