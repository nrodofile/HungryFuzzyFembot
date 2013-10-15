//
//  IngredientVC.m
//  Cooking App
//
//  Created by yumin on 21/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "IngredientVC.h"
#import "Ingredient.h"

@interface IngredientVC ()

@end

@implementation IngredientVC

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
    self.textView.text = self.text;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
