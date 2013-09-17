//
//  RecipeDetailVC.h
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface RecipeDetailVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *recipeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *cooktime;
@property (weak, nonatomic) IBOutlet UILabel *preptime;
@property (weak, nonatomic) IBOutlet UILabel *yield;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *difficulty;
@property (nonatomic, strong) Recipe *recipe;

@end
