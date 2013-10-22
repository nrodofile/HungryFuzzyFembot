//
//  Ingredient.h
//  Cooking App
//
//  Created by Stuart Stirling on 22/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Recipe *recipe;

@end
