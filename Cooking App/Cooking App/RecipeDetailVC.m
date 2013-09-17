//
//  RecipeDetailVC.m
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "RecipeDetailVC.h"
#import "Ingredient.h"

#import "ArrayOutputTestVC.h"       // testing only, please remove afterwards

@interface RecipeDetailVC ()

@end

@implementation RecipeDetailVC

@synthesize recipeLabel, recipe, image, cooktime, preptime, yield, difficulty, rating;

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.title = recipe.title;
    recipeLabel.text = recipe.title;
    image.image = [UIImage imageNamed:recipe.image];
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
    if ([segue.identifier isEqualToString:@"recipeTestSegue"]) {
        ArrayOutputTestVC *destinationView = segue.destinationViewController;
        destinationView.ingredients = recipe.ingredients;
        destinationView.methods = recipe.method;
    }
}

@end
