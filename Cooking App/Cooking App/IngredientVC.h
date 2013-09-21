//
//  IngredientVC.h
//  Cooking App
//
//  Created by yumin on 21/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ingredient.h"

@class Ingredient;

@interface IngredientVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *ingredientTextView;
@property (nonatomic, retain) NSOrderedSet *ingredients;

@end
