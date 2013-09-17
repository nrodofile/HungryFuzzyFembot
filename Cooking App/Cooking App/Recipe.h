//
//  Recipe.h
//  Cooking App
//
//  Created by Stuart Stirling on 17/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredient, IngredientTags, Method;

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
@property (nonatomic, retain) NSOrderedSet *ingredients;
@property (nonatomic, retain) NSOrderedSet *method;
@property (nonatomic, retain) NSSet *ingredienttags;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)insertObject:(Ingredient *)value inIngredientsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromIngredientsAtIndex:(NSUInteger)idx;
- (void)insertIngredients:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeIngredientsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInIngredientsAtIndex:(NSUInteger)idx withObject:(Ingredient *)value;
- (void)replaceIngredientsAtIndexes:(NSIndexSet *)indexes withIngredients:(NSArray *)values;
- (void)addIngredientsObject:(Ingredient *)value;
- (void)removeIngredientsObject:(Ingredient *)value;
- (void)addIngredients:(NSOrderedSet *)values;
- (void)removeIngredients:(NSOrderedSet *)values;
- (void)insertObject:(Method *)value inMethodAtIndex:(NSUInteger)idx;
- (void)removeObjectFromMethodAtIndex:(NSUInteger)idx;
- (void)insertMethod:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeMethodAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInMethodAtIndex:(NSUInteger)idx withObject:(Method *)value;
- (void)replaceMethodAtIndexes:(NSIndexSet *)indexes withMethod:(NSArray *)values;
- (void)addMethodObject:(Method *)value;
- (void)removeMethodObject:(Method *)value;
- (void)addMethod:(NSOrderedSet *)values;
- (void)removeMethod:(NSOrderedSet *)values;
- (void)addIngredienttagsObject:(IngredientTags *)value;
- (void)removeIngredienttagsObject:(IngredientTags *)value;
- (void)addIngredienttags:(NSSet *)values;
- (void)removeIngredienttags:(NSSet *)values;
-(void)addIngredient: (Ingredient *) values;
-(void)addAMethod: (Method *) values;


@end
