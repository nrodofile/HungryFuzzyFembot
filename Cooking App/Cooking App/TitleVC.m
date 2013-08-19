//
//  TitleVC.m
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "TitleVC.h"

@interface TitleVC ()

@end

@implementation TitleVC
@synthesize myTableView, myIngredients, myTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    myIngredients = [[NSMutableArray alloc] initWithObjects:@"Pasta", @"Tomato", @"Beef", @"Olives", @"Cheese", nil];
    
    [self.myTableView setEditing:TRUE animated:YES];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [myTableView addGestureRecognizer:gestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event methods

/*
 * Closes the keyboard.
 */
- (void)dismissKeyboard {
    [myTextField resignFirstResponder];
    myTextField.text = @"";
}

/* 
 * Whenever background is touched, close the keyboard if it is up. 
 * Clears the text.
 */
- (IBAction)backgroundTouched:(id)sender {
    [myTextField resignFirstResponder];
    myTextField.text = @"";
}

/*
 * Adds the ingredient to myIngredients and updates the tableView. 
 */
- (IBAction)textFieldReturn:(id)sender {
    if (myTextField.text.length > 0) {
        [myIngredients addObject:myTextField.text];
        
        [myTableView reloadData];
        
        [myTextField resignFirstResponder];
        myTextField.text = @"";
    }
}

#pragma mark - tableView delegate methods

/*
 * Returns the number of elements in myIngredients NSMutableArray. 
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myIngredients.count;
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
    
    cell.textLabel.text = [myIngredients objectAtIndex:indexPath.row];
    
    return cell;
}

/*
 * Removes the selected ingredient from the tableView and the myIngredient MutableArray.
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // remove from our NSMutableArray
        [myIngredients removeObjectAtIndex:indexPath.row];
        
        // remove from our tableview
        [myTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
