//
//  TitleVC.h
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "ViewController.h"

@interface TitleVC : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) NSMutableArray *myIngredients;

/*
 * Adds the string in myTextField to myIngredients array.
 * Clears the textfield and dismisses the keyboard.
 */
- (IBAction)textFieldReturn:(id)sender;

/*
 * Dismisses the keyboard when the background is touched. 
 */
- (IBAction)backgroundTouched:(id)sender;

/*
 * Dismisses the keyboard
 */
- (void)dismissKeyboard;

@end
