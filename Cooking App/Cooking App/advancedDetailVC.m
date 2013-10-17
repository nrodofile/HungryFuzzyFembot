//
//  advancedDetailVC.m
//  Cooking App
//
//  Created by Tristan on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "advancedDetailVC.h"
#import "advancedVC.h"

@interface advancedDetailVC ()
@end

@implementation advancedDetailVC
@synthesize detailArray;

#pragma mark -
#pragma mark - Initialise and Load

/*
 * Initialise AdvancedDetailVC
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 
#pragma mark - TableView delegate methods

/*
 * Return number of rows in a section based on count of detailArray
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [detailArray count];
}

/*
 * Updates the cell with a value
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [detailArray objectAtIndex:indexPath.row];
    return cell;
}

/*
 * On Cell select, pass back the text of the selected cell back to its respective dictionary key.
 * Dismiss this viewcontroller.
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [_parent.userChoices setObject:cell.textLabel.text forKey:self.key];
    [_parent.advancedTableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 
#pragma mark - EventHandlers

/*
 * Dismiss this view controller
 */
- (IBAction)cancelButton_pressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
