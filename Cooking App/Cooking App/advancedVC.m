//
//  advancedVC.m
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "advancedVC.h"
#import "advancedDetailVC.h"

@interface advancedVC ()

@end

@implementation advancedVC

@synthesize advancedTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    chefArray = [NSArray arrayWithObjects:@"Chef 1", @"Chef 2", @"Chef 3", @"Chef 4", nil];
    prepArray = [NSArray arrayWithObjects:@"< 10 mins", @"< 20 mins", @"< 30 mins", @"< 40 mins", nil];
    cookArray = [NSArray arrayWithObjects:@"< 10 mins", @"< 20 mins", @"< 30 mins", @"< 40 mins", nil];
    dietaryArray = [NSArray arrayWithObjects:@"Dietary 1", @"Dietary 2", @"Dietary 3", @"Dietary 4", nil];
    
    advancedArray = [[NSMutableArray alloc] init];
    [advancedArray addObject:@"Chef Name"];
    [advancedArray addObject:@"Prep Time"];
    [advancedArray addObject:@"Cook Time"];
    [advancedArray addObject:@"Dietary Needs"];
    [self setTitle:@"Advanced"];
    
    [self.advancedTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [advancedArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"DataCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [advancedArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    advancedDetailVC * transferViewController = segue.destinationViewController;
    
    if ([segue.identifier isEqual:@"getAdvanced"]) {
        [self setTitle:@"Advanced"];
        transferViewController.detailArray = advancedArray;
        
        NSIndexPath *indexPath = [advancedTableView indexPathForSelectedRow];
        
        if (indexPath.row == 0)
        { transferViewController.detailArray = chefArray; }
        
        if (indexPath.row == 1)
        { transferViewController.detailArray = prepArray; }
        
        if (indexPath.row == 2)
        { transferViewController.detailArray = cookArray; }
        
        if (indexPath.row == 3)
        { transferViewController.detailArray = dietaryArray; }
        
    };
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
