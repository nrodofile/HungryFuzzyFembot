//
//  Recipe.h
//  Cooking App
//
//  Created by Tristan on 25/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredient;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSNumber * cookTime;
@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * prepTime;
@property (nonatomic, retain) NSNumber * difficulty;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSNumber * yield;
@property (nonatomic, retain) NSSet *ingredients;

@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)addIngredientsObject:(Ingredient *)value;
- (void)removeIngredientsObject:(Ingredient *)value;
- (void)addIngredients:(NSSet *)values;
- (void)removeIngredients:(NSSet *)values;

@end
