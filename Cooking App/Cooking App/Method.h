//
//  Method.h
//  Cooking App
//
//  Created by Stuart Stirling on 15/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Method : NSManagedObject

@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSString * step;
@property (nonatomic, retain) Recipe *recipe;


@end