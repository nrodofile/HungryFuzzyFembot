//
//  advancedVC.m
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "advancedVC.h"
#import "advancedDetailVC.h"
#import "AppDelegate.h"

// dictionary keys
static NSString *CHEF_NAME = @"Chef Name";
static NSString *PREP_TIME = @"Prep Time";
static NSString *COOK_TIME = @"Cook Time";
static NSString *DIETARY_NEEDS = @"Dietary Needs";
static NSString *DEFAULT_ALL = @"Any";
static NSString *DEFAULT_NONE = @"None";

@interface advancedVC () {
    NSManagedObjectContext *context;
}
@end

@implementation advancedVC
@synthesize advancedTableView, userChoices, parent, advChef, advCookTime, advDietary, advPrepTime;

#pragma mark -
#pragma mark - Initialise and Load

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    // load array data
    chefArray = [self getValuesFromCoreData:@"Recipe" searchProperty:@"name"];
    dietaryArray = [self getValuesFromCoreData:@"Nutrition" searchProperty:@"label"];
    timeArray = [NSArray arrayWithObjects:DEFAULT_ALL, @"< 10 mins", @"< 20 mins", @"< 30 mins", @"< 40 mins", nil];
    
    // load dictionary of user choices
	if (userChoices == nil) {
		userChoices = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
					   DEFAULT_ALL, CHEF_NAME, DEFAULT_ALL, PREP_TIME, DEFAULT_ALL, COOK_TIME, DEFAULT_NONE, DIETARY_NEEDS, nil];
	}else{
		userChoices = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
					   advChef, CHEF_NAME, advPrepTime, PREP_TIME, advCookTime, COOK_TIME, advDietary, DIETARY_NEEDS, nil];
	}
	
	if (advChef != nil) {
		[userChoices setObject:advChef forKey:CHEF_NAME];
	}
	if (advPrepTime != nil) {
		[userChoices setObject:advPrepTime forKey:PREP_TIME];
	}
	if (advCookTime != nil) {
		[userChoices setObject:advCookTime forKey:COOK_TIME];
	}
	if (advDietary != nil) {
		[userChoices setObject:advDietary forKey:DIETARY_NEEDS];
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * Loads the chefArray with all chefs names in this application
 */
- (NSArray *)getValuesFromCoreData:(NSString *)entityName searchProperty:(NSString*)property {
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setResultType:NSDictionaryResultType];
    [request setReturnsDistinctResults:YES];
    [request setPropertiesToFetch:@[property]];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (objects == nil)
        return [[NSArray alloc] init];
    
    
    // nsdictionary to nsarray
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (NSDictionary *d in objects) {
        if ([d objectForKey:property] != nil)
            [tempArray addObject:[d objectForKey:property]];
    }
    
    // return sorted array
    return [tempArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

#pragma mark -
#pragma mark - TableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [userChoices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"DataCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // do cell info
    NSString *dictionaryKey = [[userChoices allKeys] objectAtIndex:indexPath.row];
    
    UILabel *title = (UILabel*)[cell viewWithTag:101];
    title.text = dictionaryKey;
    
    UILabel *value = (UILabel*)[cell viewWithTag:100];
    value.text = [userChoices objectForKey:dictionaryKey];
	
	if (dictionaryKey == CHEF_NAME) {
		advChef = value.text;
		if ([value.text  isEqualToString:DEFAULT_ALL]) {
			parent.authorSearch = nil;
		}else {
			parent.authorSearch = value.text;
		}
		
	} else if (dictionaryKey == PREP_TIME){
		advPrepTime = value.text;
		if ([value.text isEqualToString:DEFAULT_ALL]) {
			parent.prepTimeSearch = nil;
		}else {
			parent.prepTimeSearch = value.text;
		}
		
	} else if (dictionaryKey == COOK_TIME){
		advCookTime = value.text;
		if ([value.text isEqualToString:DEFAULT_ALL]) {
			parent.cookTimeSearch = nil;
		}else {
			parent.cookTimeSearch = value.text;
		}
		
	} else if (dictionaryKey == DIETARY_NEEDS){
		advDietary = value.text;
		if ([value.text isEqualToString:DEFAULT_NONE]){
			parent.dietarySearch = nil;
		}else {
			parent.dietarySearch = value.text;
		}
	}
	
    return cell;
}

#pragma mark -
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    advancedDetailVC *transferViewController = segue.destinationViewController;
    transferViewController.parent = self;
    
    NSIndexPath *indexPath = [advancedTableView indexPathForSelectedRow];
    NSString *selectedCell = [[userChoices allKeys] objectAtIndex:indexPath.row];
    
    // transfer array of selected cell
    if ([selectedCell isEqualToString:CHEF_NAME])
        transferViewController.detailArray = chefArray;
    else if ([selectedCell isEqualToString:PREP_TIME] || [selectedCell isEqualToString:COOK_TIME])
        transferViewController.detailArray = timeArray;
    else if ([selectedCell isEqualToString:DIETARY_NEEDS])
        transferViewController.detailArray = dietaryArray;
    
    transferViewController.key = selectedCell;
    transferViewController.title = selectedCell;
	
}

// reset search options
-(void)resetView
{
    userChoices = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
				   DEFAULT_ALL, CHEF_NAME, DEFAULT_ALL, PREP_TIME, DEFAULT_ALL, COOK_TIME, DEFAULT_NONE, DIETARY_NEEDS, nil];
	advChef = nil;
	advPrepTime = nil;
	advCookTime = nil;
	advDietary = nil;
    [self.advancedTableView reloadData];
}

-(void)viewWillAppear
{
    [self resetView];
}

- (IBAction)clickReset:(id)sender
{
    [self resetView];
}





@end
