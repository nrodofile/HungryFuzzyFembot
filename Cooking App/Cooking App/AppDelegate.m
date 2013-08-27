//
//  AppDelegate.m
//  asdasd
//
//  Created by Tristan on 24/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "AppDelegate.h"
#import "Recipe.h"
#import "Ingredient.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - Core Data add, fetch methods

/* 
 * Adds recipes to local datastore.
 * This is the only way to insert recipes until we create a UI recipe maker.
 */
- (void)addRecipe {
    Recipe *recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:self.managedObjectContext];
    
    // set recipe properties
    recipe.title = @"Eggs Benedict";
    recipe.prepTime = [NSNumber numberWithInt:15];
    recipe.cookTime = [NSNumber numberWithInt:35];
    recipe.difficulty = [NSNumber numberWithInt:3];     // difficulty out of 5 (1 - easiest, 5 - hardest)
    recipe.yield = [NSNumber numberWithInt:4];
    recipe.rating = [NSNumber numberWithInt:4];         // rating out of 5
    recipe.thumbnail = @"egg_benefict.jpg";
    
    // ingredients to be inserted
    Ingredient *i1 = [self createIngredientWithTitle:@"free-range eggs" Amount:[NSNumber numberWithInt:8] Measurement:@"50g"];
    [recipe addIngredientsObject:i1];
    
    Ingredient *i2 = [self createIngredientWithTitle:@"Salt" Amount:nil Measurement:@"Pinch"];
    [recipe addIngredientsObject:i2];
    
    Ingredient *i3 = [self createIngredientWithTitle:@"Ham Speck" Amount:[NSNumber numberWithInt:8] Measurement:@"Slices"];
    [recipe addIngredientsObject:i3];
    
    Ingredient *i4 = [self createIngredientWithTitle:@"baguette (French Stick)" Amount:[NSNumber numberWithInt:0.5] Measurement:nil];
    [recipe addIngredientsObject:i4];
    
    Ingredient *i5 = [self createIngredientWithTitle:@"butter (optional)" Amount:[NSNumber numberWithInt:50] Measurement:@"g"];
    [recipe addIngredientsObject:i5];
    
    Ingredient *i6 = [self createIngredientWithTitle:@"bunch fresh chives" Amount:[NSNumber numberWithInt:0.5] Measurement:nil];
    [recipe addIngredientsObject:i6];
    

    // handle the error message
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Problem saving: %@", [error localizedDescription]);
    } else {
        NSLog(@"Inserted Recipe: %@ - success!", recipe.title);
    }
}

/*
 * Creates and returns an Ingredient* to store in a Recipe*
 */
- (Ingredient *)createIngredientWithTitle:(NSString *)title Amount:(NSNumber *)amount Measurement:(NSString *)measurement {
    Ingredient *ingredient = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredient" inManagedObjectContext:self.managedObjectContext];
    
    // set ingredient properties
    ingredient.title = title;
    ingredient.amount = amount;
    ingredient.measurement = measurement;
    
    return ingredient;
}


#pragma mark - AppDelegate methods

/* 
 * After finishing loading, create some Core Data objects and insert them to Core Data.
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // adds recipe to local datastore. comment when done to avoid duplicates
    //[self addRecipe];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RecipeDb" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RecipeDb.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
