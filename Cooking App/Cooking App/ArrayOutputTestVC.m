//
//  ArrayOutputTestVC.m
//  Cooking App
//
//  Created by Tristan on 17/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "ArrayOutputTestVC.h"
#import "Ingredient.h"
#import "Method.h"

@interface ArrayOutputTestVC ()

@end

@implementation ArrayOutputTestVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSMutableString *text = [NSMutableString string];
    [text appendFormat:@"Ingredients Count - %i", self.ingredients.count];
    
    for (Ingredient *ingredient in self.ingredients) {
        [text appendFormat:@"\n- %@", ingredient.label];
    }
    
    [text appendFormat:@"\n\nMethods Count - %i", self.methods.count];
    
    for (Method *method in self.methods) {
        [text appendFormat:@"\n- %@", method.step];
    }

    self.textField.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
