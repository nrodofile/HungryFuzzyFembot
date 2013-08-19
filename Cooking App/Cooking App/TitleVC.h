//
//  TitleVC.h
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *myIngredients;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)textFieldReturn:(id)sender;
- (IBAction)backgroundTouched:(id)sender;
- (void)dismissKeyboard;

@end
