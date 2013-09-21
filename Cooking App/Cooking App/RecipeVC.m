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
#import "Ingredient.h"
#import "Method.h"

@interface RecipeVC ()

@end

@implementation RecipeVC {
    NSManagedObjectContext *context;
    //NSArray *recipes;            // temporary storage for recipes
}

@synthesize myTableView, recipes;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set delegate and datasource of myTableView to self
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    // initialise recipes from Core Data
    //recipes = [self fetchAllRecipeData];
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
	

//    imageView.image = [UIImage imageNamed:recipe.thumbnail];
	
	// NOTE: used as Example can be commented and uncomment above
	//		 may need to add image URL to recipe object 
	NSString *eggs = @"http://aww.ninemsn.com.au/img/food/cookbooks/eatingtogether/eggs.jpg";	
	[self DownloadRecipeImage:eggs :imageView];
    
    // recipe title
    UILabel *recipeTitle = (UILabel *)[cell viewWithTag:101];
    recipeTitle.text = recipe.title;
    
    // recipe details
    UILabel *recipeDetails = (UILabel *)[cell viewWithTag:102];
    recipeDetails.text = [NSString stringWithFormat:@"Cook Time: %@", recipe.cooktime];
    
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
        // yumin modified
        //
        destVC.recipe = [recipes objectAtIndex:indexPath.row];
        destVC.recipe.title = [[recipes objectAtIndex:indexPath.row] title];
        destVC.recipe.image = [[recipes objectAtIndex:indexPath.row] image];
        destVC.recipe.cooktime = [[recipes objectAtIndex:indexPath.row] cooktime];
        destVC.recipe.preptime = [[recipes objectAtIndex:indexPath.row] preptime];
        destVC.recipe.yield = [[recipes objectAtIndex:indexPath.row] yield];
        destVC.recipe.difficulty = [[recipes objectAtIndex:indexPath.row] difficulty];
        destVC.recipe.rating = [[recipes objectAtIndex:indexPath.row] rating];

    }
}
/*
 * Downloads image asyncronously from url
 */
-(void)DownloadRecipeImage:(NSString *)imgUrl :(UIImageView *) image{
	
	//sets queue for download
	dispatch_queue_t downloadQueue = dispatch_queue_create("Image", NULL);
	
	//all tasks downloaded on seperate thread
	dispatch_async(downloadQueue, ^{
		NSURL *url = [NSURL URLWithString:imgUrl];
		image.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];// Downloads for a long time!
	});
}

@end
