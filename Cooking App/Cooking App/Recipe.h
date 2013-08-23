//
//  Recipe.h
//  Cooking App
////  Created by Stuart Stirling on 22/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject {
    
    // Recipe Attributes
    NSInteger recipeID, prepTime, inactiveTime, cookTime, difficulty, rating, authorId;
    NSString *title, *yield;
    
       
}

// Methods that set the attribute values to the Recipe object.
- (void) setRecipeID:(NSInteger) rID;
- (void) setTitle: (NSString*) t;
- (void) setPrepTime: (NSInteger) p;
- (void) setInactiveTime: (NSInteger) i;
- (void) setCookTime: (NSInteger) c;
- (void) setDifficulty: (NSInteger) d;
- (void) setRating: (NSInteger) r;
- (void) setYield: (NSString*) y;
- (void) setAuthorID: (NSInteger) a;

// Methods that return the attribute values from the Recipe object.
- (NSInteger) returnRecipeID;
- (NSString*) returnTitle;
- (NSInteger) returnPrepTime;
- (NSInteger) returnInactiveTime;
- (NSInteger) returnCookTime;
- (NSInteger) returnDifficulty;
- (NSInteger) returnRating;
- (NSString*) returnYield;
- (NSInteger) returnAuthorID;

@end

