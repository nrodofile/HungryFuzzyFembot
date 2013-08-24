//
//  Recipe.h
//  Cooking App
//
//  Created by Tristan on 24/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *toIngredients;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)addToIngredientsObject:(NSManagedObject *)value;
- (void)removeToIngredientsObject:(NSManagedObject *)value;
- (void)addToIngredients:(NSSet *)values;
- (void)removeToIngredients:(NSSet *)values;

@end
