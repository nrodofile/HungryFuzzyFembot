//
//  Cooking_AppTests.h
//  Cooking AppTests
//
//  Created by Tristan on 13/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class Recipe;

static const NSString *recipeId = @"23";

@interface CoreDataRecipeTest : SenTestCase {
    NSManagedObjectContext *testingContext;
    Recipe *testRecipe;
}

@end
