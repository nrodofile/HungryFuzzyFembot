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
    
    NSLog(@"%@", elementName);
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
        [recipe addIngredientsObject:ingredient];
    }
    else if ([elementName isEqualToString:@"ingredients"]) {
        currentElementValue = nil;
    }
    else if ([elementName isEqualToString:@"methodstep"]){

    }
    else if ([elementName isEqualToString:@"method"]) {
        currentElementValue = nil;
    }
    else {
        
        [recipe setValue:currentElementValue forKey:elementName];
        currentElementValue = nil;
        
    }
}

@end
