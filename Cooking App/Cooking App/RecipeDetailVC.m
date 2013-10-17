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

#import "Nutrition.h"
#import "IngredientTags.h"

@interface RecipeDetailVC ()
@end

@implementation RecipeDetailVC

@synthesize recipeLabel, recipe, image, cooktime, preptime, yield, difficulty, rating, author, ingredientsButton, methodsButton;

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [self DownloadRecipeImage:recipe.image];
    
    recipeLabel.text = recipe.title;
    cooktime.text = [NSString stringWithFormat:@"Cook Time: %@ mins", recipe.cooktime];
    preptime.text = [NSString stringWithFormat:@"Prep Time: %@ mins", recipe.preptime];
    difficulty.text = [NSString stringWithFormat:@"Difficuty: %@", recipe.difficulty];
    rating.text = [NSString stringWithFormat:@"Rating: %@/5", recipe.rating];
    yield.text = [NSString stringWithFormat:@"Servings: %@", recipe.yield];
    author.text = [NSString stringWithFormat:@"By %@", recipe.name];
    
    for (Nutrition *nutrition in recipe.nutrition)
        NSLog(@"%@", nutrition.label);
    
    for (IngredientTags *tag in recipe.ingredienttags)
        NSLog(@"%@", tag.baseingredient);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //segue to recipetest view
    if ([segue.identifier isEqualToString:@"ingredientSegue"]) {
        NSMutableString *ingredientText = [NSMutableString string];
        
        for (Ingredient *ingredient in recipe.ingredients) {
            [ingredientText appendFormat:@"\n- %@", ingredient.label];
        }
        
        IngredientVC *destinationView = segue.destinationViewController;
        destinationView.text = ingredientText;
    }
    else if ([segue.identifier isEqualToString:@"methodSegue"]) {
        NSMutableString *methodText = [NSMutableString string];
        
        for (Method *method in recipe.method) {
            [methodText appendFormat:@"\n- %@", method.step];
        }
        
        IngredientVC *destinationView = segue.destinationViewController;
        destinationView.text = methodText;
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
		UIImage * download = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
		dispatch_async(dispatch_get_main_queue(), ^ {
			self.image.image = download;
		});
	});
}

@end
