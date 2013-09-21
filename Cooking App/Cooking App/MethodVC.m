//
//  MethodVC.m
//  Cooking App
//
//  Created by yumin on 21/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import "MethodVC.h"
#import "Method.h"

@interface MethodVC ()

@end

@implementation MethodVC

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
    
    NSMutableString *methodText = [NSMutableString string];
    [methodText appendFormat:@"\n\nMethods Count - %i", self.methods.count];
    
    for (Method *method in self.methods) {
        [methodText appendFormat:@"\n- %@", method.step];
    }
    
    self.methodTextView.text = methodText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
