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

@interface advancedVC ()

@end

static NSString *CHEF_NAME = @"Chef Name";
static NSString *PREP_TIME = @"Prep Time";
static NSString *COOK_TIME = @"Cook Time";
static NSString *DIETARY_NEEDS = @"Dietary Needs";

@implementation advancedVC

@synthesize advancedTableView, userChoices;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // load array data
    chefArray = [[NSMutableArray alloc] init];
    timeArray = [NSArray arrayWithObjects:@"< 10 mins", @"< 20 mins", @"< 30 mins", @"< 40 mins", nil];
    dietaryArray = [NSArray arrayWithObjects:@"Dietary 1", @"Dietary 2", @"Dietary 3", @"Dietary 4", nil];
    
    // load dictionary of user choices
    userChoices = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Any", CHEF_NAME, @"All", PREP_TIME,
                                                               @"All", COOK_TIME, @"None", DIETARY_NEEDS, nil];
    
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Recipe" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setResultType:NSDictionaryResultType];
    [request setReturnsDistinctResults:YES];
    [request setPropertiesToFetch:@[@"name"]];
    
    NSError *error;

    NSArray *objects = [context executeFetchRequest:request error:&error];
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    if (objects == nil) {
        // errorr
        NSLog(@"ERROR");
    } else {
        for (NSDictionary *d in objects) {
            [tempArray addObject:[d objectForKey:@"name"]];
        }
        
        chefArray = [tempArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    
    

    [self.advancedTableView reloadData];
}

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
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"getAdvanced"]) {
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
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
