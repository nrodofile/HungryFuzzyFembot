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

/*
 * This method runs when the screen loaded successfully.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set the delegate and datasource to self
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    // initialise the array with preset ingredients
    myIngredients = [[NSMutableArray alloc] initWithObjects:@"Pasta", @"Tomato", @"Beef", @"Olives", @"Cheese", nil];
    
    // allow deletion of tableView during run-time
    [self.myTableView setEditing:TRUE animated:YES];
    
    // Gesture recognizer which listens when the user touches the tableView background.
    // When fired, it will dismiss the keyboard.
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    
    [myTableView addGestureRecognizer:gestureRecognizer];
}

#pragma mark - event methods

/*
 * Dismisses the keyboard
 */
- (void)dismissKeyboard {
    [myTextField resignFirstResponder];
    myTextField.text = @"";
}

/*
 * Dismisses the keyboard when the background is touched.
 */
- (IBAction)backgroundTouched:(id)sender {
    [self dismissKeyboard];
}

/*
 * Adds the string in myTextField to myIngredients array.
 * Clears the textfield and dismisses the keyboard.
 */
- (IBAction)textFieldReturn:(id)sender {
    if (myTextField.text.length > 0) {
        [myIngredients addObject:myTextField.text];
        
        [myTableView reloadData];
        [self dismissKeyboard];
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
 * Removes the selected ingredient from the tableView and myIngredient MutableArray.
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
