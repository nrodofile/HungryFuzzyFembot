//
//  ViewController.h
//  Cooking App
//
//  Created by Tristan on 27/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSManagedObjectContext *context;
}

- (NSArray *)fetchAllRecipeData;
- (NSArray *)fetchRecipeDataWithPredicate:(NSArray *)predicates;

@end
