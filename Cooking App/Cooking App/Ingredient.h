//
//  Ingredient.h
//  Cooking App
//
//  Created by Stuart Stirling on 15/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * measurement;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Recipe *recipe;

@end
