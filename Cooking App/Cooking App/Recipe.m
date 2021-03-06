//
//  Recipe.m
//  Cooking App
//
//  Created by Stuart Stirling on 22/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "Recipe.h"
#import "Ingredient.h"
#import "IngredientTags.h"
#import "Method.h"
#import "Nutrition.h"


@implementation Recipe

@dynamic authorid;
@dynamic cooktime;
@dynamic difficulty;
@dynamic image;
@dynamic inactivetime;
@dynamic name;
@dynamic preptime;
@dynamic rating;
@dynamic recipeid;
@dynamic title;
@dynamic url;
@dynamic yield;
@dynamic ingredients;
@dynamic ingredienttags;
@dynamic method;
@dynamic nutrition;

-(void)addIngredient:(Ingredient *)values {
    NSMutableOrderedSet* tempSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.ingredients];
    [tempSet addObject:values];
    self.ingredients = tempSet;
}

-(void)addAMethod:(Method *)values {
    NSMutableOrderedSet* tempSet = [NSMutableOrderedSet orderedSetWithOrderedSet:self.method];
    [tempSet addObject:values];
    self.method = tempSet;
}

@end
