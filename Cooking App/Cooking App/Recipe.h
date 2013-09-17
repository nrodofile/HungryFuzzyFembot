//
//  Recipe.h
//  Cooking App
//
//  Created by Stuart Stirling on 15/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredient;
@class Method;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSString * authorid;
@property (nonatomic, retain) NSString * cooktime;
@property (nonatomic, retain) NSString * difficulty;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * inactivetime;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * preptime;
@property (nonatomic, retain) NSString * rating;
@property (nonatomic, retain) NSString * recipeid;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * yield;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSSet *ingredients;
@property (nonatomic, retain) NSSet *method;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)addIngredientsObject:(Ingredient *)value;
- (void)removeIngredientsObject:(Ingredient *)value;
- (void)addIngredients:(NSSet *)values;
- (void)removeIngredients:(NSSet *)values;

@end
