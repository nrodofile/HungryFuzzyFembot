//
//  RecipeDetailVC.m
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "RecipeDetailVC.h"
#import "Ingredient.h"
#import "Method.h"
#import "IngredientVC.h"
#import "MethodVC.h"



@interface RecipeDetailVC ()

@end

@implementation RecipeDetailVC

@synthesize recipeLabel, recipe, image, cooktime, preptime, yield, difficulty, rating;

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.title = recipe.title;
    recipeLabel.text = recipe.title;
    [self DownloadRecipeImage:recipe.image];
    cooktime.text = recipe.cooktime;
    preptime.text = recipe.preptime;
    yield.text = recipe.yield;
    difficulty.text = recipe.difficulty;
    rating.text = recipe.rating;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //segue to recipetest view
    if ([segue.identifier isEqualToString:@"recipeingredientSegue"]) {
        IngredientVC *destinationView = segue.destinationViewController;        
        destinationView.ingredients = recipe.ingredients;
    }
    
    if ([segue.identifier isEqualToString:@"recipeMethodSegue"]) {
        MethodVC *destinationView = segue.destinationViewController;        
        destinationView.methods = recipe.method;
    }
}

/*
 * Downloads image asyncronously from url
 */
-(void)DownloadRecipeImage:(NSString *)imgUrl {
	
	//sets queue for download
	dispatch_queue_t downloadQueue = dispatch_queue_create("Image", NULL);
	
	//all tasks downloaded on seperate thread
	dispatch_async(downloadQueue, ^{
		NSURL *url = [NSURL URLWithString:imgUrl];
		UIImage * download = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];// Downloads for a long time!
		dispatch_async(dispatch_get_main_queue(), ^ {
			self.image.image = download;
		});
	});
}

@end
