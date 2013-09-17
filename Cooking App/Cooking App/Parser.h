//
//  Parser.h
//  Cooking App
//
//  Created by Stuart Stirling on 31/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Recipe.h"


@interface Parser : NSObject <NSXMLParserDelegate> {
    NSManagedObjectContext *context;
    Recipe *recipe;
    Ingredient *ingredient;
    Method *method;
    
    NSMutableString *currentElementValue;
}

@property (nonatomic, retain) NSMutableArray *recipeArray;

- (id) initParser;
@end
