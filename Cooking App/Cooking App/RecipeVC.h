//
//  RecipeVC.h
//  Cooking App
//
//  Created by Tristan on 19/08/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Recipe.h"

@interface RecipeVC : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *recipes;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end
