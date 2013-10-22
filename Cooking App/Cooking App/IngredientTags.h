//
//  IngredientTags.h
//  Cooking App
//
//  Created by Stuart Stirling on 22/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface IngredientTags : NSManagedObject

@property (nonatomic, retain) NSString * baseingredient;
@property (nonatomic, retain) NSNumber * tagid;
@property (nonatomic, retain) Recipe *recipe;

@end
