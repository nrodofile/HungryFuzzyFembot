//
//  Parser.m
//  Cooking App
//
//  Created by Stuart Stirling on 31/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "Parser.h"


@implementation Parser
@synthesize recipeArray;



-(id) initParser {
    if (self ==[super init]){
        recipeArray = [[NSMutableArray alloc] init];
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        context = appDelegate.managedObjectContext;
        
        
    }
    
    return self;
}

// Did parser connection recieve data, create an array
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
        
    if ([elementName isEqualToString:@"recipe"]) {
        recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:context];
    }
    else if ([elementName isEqualToString:@"ingredient"]) {
        ingredient =[NSEntityDescription insertNewObjectForEntityForName:@"Ingredient" inManagedObjectContext:context];
    }
    else if ([elementName isEqualToString:@"methodstep"]) {
       method =[NSEntityDescription insertNewObjectForEntityForName:@"Method" inManagedObjectContext:context];
    }
    else if ([elementName isEqualToString:@"tag"]) {
        tag =[NSEntityDescription insertNewObjectForEntityForName:@"Ingredienttags" inManagedObjectContext:context];
    }
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSString *value = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:value];
    } else {
        [currentElementValue appendString:value];
    }
    
}


//Do stuff
-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"foodnetwork"]) {
        return;
    }
    
    if ([elementName isEqualToString:@"recipe"]) {
        [recipeArray addObject:recipe];
        recipe = nil;
    }
    else if ([elementName isEqualToString:@"time"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"author"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"ingredient"]){
        [recipe addIngredient:ingredient];
        currentElementValue = nil;
        
    }
    else if ([elementName isEqualToString:@"number"]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * myNumber = [f numberFromString:currentElementValue];
        
        [ingredient setValue:myNumber forKey:elementName];
        currentElementValue = nil;

    }
    else if ([elementName isEqualToString:@"label"]) {
        [ingredient setValue:currentElementValue forKey:elementName];
    }
    else if ([elementName isEqualToString:@"ingredients"]) {
    currentElementValue = nil;
    }

    else if ([elementName isEqualToString:@"order"]){
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * myNumber = [f numberFromString:currentElementValue];
        
        [method setValue:myNumber forKey:elementName];

    }
    else if ([elementName isEqualToString:@"step"]) {
        [method setValue:currentElementValue forKey:elementName];
        
    }
    else if ([elementName isEqualToString:@"methodstep"]){
        [recipe addAMethod:method];
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"method"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"nutrition"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"nutritionid"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"type"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"ingredienttags"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"tag"]) {
        [recipe addIngredienttagsObject:tag];
    }

    else if ([elementName isEqualToString:@"tagid"]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber * myNumber = [f numberFromString:currentElementValue];
        
        [tag setValue:myNumber forKey:elementName];
                currentElementValue = nil;
        
    }
    else if ([elementName isEqualToString:@"baseingredient"]) {
        [tag setValue:currentElementValue forKey:elementName];
    }
    else {
        [recipe setValue:currentElementValue forKey:elementName];
        currentElementValue = nil;

    }
}

@end
