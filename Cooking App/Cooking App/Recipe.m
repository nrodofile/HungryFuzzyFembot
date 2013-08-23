//
//  Recipe.m
//  Cooking App
//
//  Created by Stuart Stirling on 22/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "Recipe.h"

@interface Recipe() {
    NSMutableArray* Ingredients;
}

@end


@implementation Recipe

// Some initialisation tristan was talking about

/*- (id) init {
    self = [super init];
    if (self) {
    
    }
}
*/


// Set Methods
- (void) setRecipeID:(NSInteger)rID {
    recipeID = rID;
}

-(void) setTitle:(NSString*)t {
    title = t;
}

- (void) setPrepTime:(NSInteger)p {
    prepTime = p;
}

- (void) setInactiveTime:(NSInteger)i {
    inactiveTime = i;
}

- (void) setCookTime:(NSInteger)c {
    cookTime = c;
}

- (void) setDifficulty:(NSInteger)d {
    difficulty = d;
}

- (void) setRating:(NSInteger)r {
    rating = r;
}

- (void) setYield:(NSString*)y {
    yield = y;
}

- (void) setAuthorID:(NSInteger)a {
    authorId = a;
}

- (NSInteger) returnRecipeID {
    return recipeID;
}

// Return Methods
- (NSString*) returnTitle {
    return title;
}

- (NSInteger) returnPrepTime {
    return prepTime;
}

- (NSInteger) returnInactiveTime {
    return inactiveTime;
}

- (NSInteger) returnCookTime {
    return cookTime;
}

- (NSInteger) returnDifficulty {
    return difficulty;
}

- (NSInteger) returnRating {
    return rating;
}

- (NSString*) returnYield {
    return yield;
}

- (NSInteger) returnAuthorID {
    return authorId;
}

@end
