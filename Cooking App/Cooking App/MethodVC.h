//
//  MethodVC.h
//  Cooking App
//
//  Created by yumin on 21/09/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Method.h"

@class Method;

@interface MethodVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *methodTextView;
@property (nonatomic, retain) NSOrderedSet *methods;

@end
