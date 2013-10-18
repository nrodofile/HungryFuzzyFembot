//
//  TitleVC.h
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "ViewController.h"
#import "advancedVC.h"

@interface TitleVC : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) NSMutableArray *myIngredients;
@property (strong, nonatomic) NSArray *recipes;
@property (strong, nonatomic) NSString *authorSearch;
@property (strong, nonatomic) NSString *cookTimeSearch;
@property (strong, nonatomic) NSString *prepTimeSearch;



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

/*
* Gets all Recipes using ingredients
*/
-(void)searchRecipes;

/*
 * prepare segue for RecipeVC, passing over all recipies
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
