//
//  ArrayOutputTestVC.h
//  Cooking App
//
//  Created by Tristan on 17/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ingredient;
@class Method;

@interface ArrayOutputTestVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textField;

@property (nonatomic, retain) NSOrderedSet *ingredients;
@property (nonatomic, retain) NSOrderedSet *methods;

@end
