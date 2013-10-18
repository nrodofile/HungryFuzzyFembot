//
//  advancedVC.h
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

// protocol declaration
@protocol myDelegate

@optional
-(void)selectedValueIs:(NSString *)value;

// set it as the property

@end

@interface advancedVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *chefArray;
    NSMutableArray *timeArray;
    NSArray *dietaryArray;
	NSString *advChef;
	NSString *advPrepTime;
	NSString *advCookTime;
	NSString *advDietary;
	
}

@property (weak, nonatomic) IBOutlet UITableView *advancedTableView;

@property (strong, nonatomic) NSMutableDictionary *userChoices;

@property (nonatomic, assign) id<myDelegate> selectedValueDelegate;

@end
