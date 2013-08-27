//
//  ViewController.m
//  Cooking App
//
//  Created by Tristan on 27/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
}

/*
 * Returns all recipe data in datastore as NSArray*
 */
- (NSArray *)fetchAllRecipeData {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
    
    return [context executeFetchRequest:request error:nil];
}

/*
 * Fetches all recipe data with the matching predicate
 */
- (NSArray *)fetchRecipeDataWithPredicate:(NSArray *)predicates {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
    NSPredicate *predicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
    
    [request setPredicate:predicate];
    
    return [context executeFetchRequest:request error:nil];
}


@end
