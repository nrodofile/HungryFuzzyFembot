/*
 * Core Data Recipe object test
 *
 * Author: Tristan Le
 * Date: 18-Oct-2013
 */

#import "CoreDataRecipeTest.h"
#import "AppDelegate.h"
#import "Recipe.h"

@implementation CoreDataRecipeTest

// creates Context for us to work with
- (void)setUp {
    [super setUp];
    
    // set up context
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    testingContext = delegate.managedObjectContext;
    if (testingContext == nil)
        return;
    
    // set up recipe test object
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"recipeid = %@", recipeId];
    [request setPredicate:predicate];
    
    NSArray *array = [testingContext executeFetchRequest:request error:nil];
    if (array.count > 0) {
        testRecipe = [array objectAtIndex:0];
    }
}

// clear testingContext
- (void)tearDown {
    testingContext = nil;
    [super tearDown];
}

- (void)testNilContext {
    STAssertNotNil(testingContext, @"The testing context is nil!");
}

- (void)testNilRecipe {
    STAssertNotNil(testRecipe, @"The testing recipe is nil!");
}

- (void)testRecipeTitle {
    NSString *expected = @"20-Minute Hoisin Skillet Salmon";
    STAssertTrue([testRecipe.title isEqualToString:expected], @"Recipe title does not match expected result");
}

- (void)testRecipeDifficulty {
    NSString *expected = @"Easy";
    STAssertTrue([testRecipe.difficulty isEqualToString:expected], @"Recipe difficulty does not match expected result");
}

- (void)testRecipeRating {
    NSString *expected = @"4";
    STAssertTrue([testRecipe.rating isEqualToString:expected], @"Recipe Rating does not match expected result");
}

- (void)testRecipeYield {
    NSString *expected = @"4 servings";
    STAssertTrue([testRecipe.yield isEqualToString:expected], @"Yield does not match expected result");
}

- (void)testRecipeUrlImage {
    NSString *expected = @"http://img.foodnetwork.com/FOOD/2012/10/26/FNK_Healthy-20-Minute-Hoisin-Skillet-Salmon_s4x3_med.jpg";
    STAssertTrue([testRecipe.image isEqualToString:expected], @"Url Image does not match expected result");
}

- (void)testRecipeUrlSource {
    NSString *expected = @"http://www.foodnetwork.com/recipes/20-minute-hoisin-skillet-salmon-recipe/index.html";
    STAssertTrue([testRecipe.url isEqualToString:expected], @"Source url does not match expected result");
}

- (void)testRecipePrepTime {
    NSString *expected = @"10";
    STAssertTrue([testRecipe.preptime isEqualToString:expected], @"Prep time does not match expected result");
}

- (void)testRecipeInactiveTime {
    NSString *expected = @"0";
    STAssertTrue([testRecipe.inactivetime isEqualToString:expected], @"Inactive time does not match expected result");
}

- (void)testRecipeCookTime {
    NSString *expected = @"10";
    STAssertTrue([testRecipe.cooktime isEqualToString:expected], @"Cook time does not match expected result");
}

- (void)testRecipeAuthor {
    NSString *expected = @"Food Network Kitchens";
    STAssertTrue([testRecipe.name isEqualToString:expected], @"Author does not match");
}

- (void)testRecipeIngredients {
    NSString *property = @"ingredients.label";
    
    BOOL test1 = [self fetchElement:property andValue:@"Juice of 1/2 lemon"];
    BOOL test2 = [self fetchElement:property andValue:@"Kosher salt"];
    BOOL test3 = [self fetchElement:property andValue:@"2 cloves garlic, crushed"];
    
    STAssertTrue(test1 && test2 && test3, @"Ingredients labels are not inserted correctly");
}

- (void)testRecipeMethods {
    NSString *property = @"method.step";
    
    BOOL test1 = [self fetchElement:property andValue:@"Salmon is a great source of heart-healthy omega-3 fatty acids and looks beautiful on a bed of vitamin C-rich broccoli. Topped off with colorful red pepper flakes and fresh cilantro, this bright, low-calorie meal takes under 20 minutes."];

    STAssertTrue(test1, @"Method step are not inserted correctly");
}

- (void)testRecipeDietaryNeeds {
    NSString *property = @"nutrition.label";
    
    BOOL test1 = [self fetchElement:property andValue:@"Gluten Free"];
    BOOL test2 = [self fetchElement:property andValue:@"Low Sodium"];
    BOOL test3 = [self fetchElement:property andValue:@"Low Fat"];
    
    STAssertTrue(test1 && test2 && test3, @"Dietary needs are not stored correctly");
}

- (void)testRecipeTags {
    NSString *property = @"ingredienttags.baseingredient";
    
    BOOL test1 = [self fetchElement:property andValue:@"cloves"];
    BOOL test2 = [self fetchElement:property andValue:@"garlic"];
    BOOL test3 = [self fetchElement:property andValue:@"hoisin"];
    
    STAssertTrue(test1 && test2 && test3, @"Tags are not stored correctly");
}


// helper method to search for specific things in the core data persistent store.
- (BOOL)fetchElement:(NSString *)property andValue:(NSString *)value {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
    
    NSString *label = [NSString stringWithFormat:@"ANY %@ MATCHES[c] '%@'", property, value];
    
    NSMutableArray *predicates = [[NSMutableArray alloc] init];
    [predicates addObject:[NSPredicate predicateWithFormat:@"recipeid = %@", recipeId]];
    [predicates addObject:[NSPredicate predicateWithFormat:label]];
     
    NSPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
    [request setPredicate:compoundPredicate];
    
    NSArray *results = [testingContext executeFetchRequest:request error:nil];
    if (results.count > 0)
        return true;
    else
        return false;
}





@end
