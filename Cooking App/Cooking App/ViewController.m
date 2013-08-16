//
//  ViewController.m
//  Cooking App
//
//  Created by Tristan on 13/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myTableView, ingredients;

/* 
 * Did view controller load successfully?
 */
- (void)viewDidLoad {
    [super viewDidLoad];
	
    // set datasource and delegate to self
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    // initialise NSMutuableArray
    ingredients = [[NSMutableArray alloc] initWithObjects:@"Egg", @"Bread", nil];
    
    // set the title
    self.title = @"Ingredients";
    
    // add an "edit" button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //add the "Add" button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                  action:@selector(insertNewObject)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 * Make the table view editable
 */
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [myTableView setEditing:editing animated:animated];
}

- (void)insertNewObject {
    // display a UIAlertView
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter an ingredient" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

#pragma mark - UITableView DataSource

/* 
 * Returns a count of elements in ingredients array.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ingredients count];
}

/*
 * Inserts ingredients in the TableView
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [ingredients objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // remove from our NSMutableArray
        [ingredients removeObjectAtIndex:indexPath.row];
        
        // remove from our tableview
        [myTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - UITableView Delegate methods

#pragma mark - UIAlertView Delegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // only do the following actions if the user hits the OK button
    if (buttonIndex == 1) {
        NSString *theIngredient = [alertView textFieldAtIndex:0].text;
        
        // make sure we have a place to store our ingredients inputs
        if (!ingredients) {
            ingredients = [[NSMutableArray alloc] init];
        }
        
        [ingredients insertObject:theIngredient atIndex:0];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.myTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
