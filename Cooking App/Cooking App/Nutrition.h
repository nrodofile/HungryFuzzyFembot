//
//  Nutrition.h
//  Cooking App
//
//  Created by Stuart Stirling on 16/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Nutrition : NSManagedObject

@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * nutritionid;
@property (nonatomic, retain) Recipe *recipe;

@end
