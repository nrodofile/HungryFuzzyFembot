//
//  advancedVC.h
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleVC.h"

@class TitleVC;

@interface advancedVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *chefArray;
    NSMutableArray *timeArray;
    NSArray *dietaryArray;
}

@property (weak, nonatomic) IBOutlet UITableView *advancedTableView;

@property (strong, nonatomic) NSMutableDictionary *userChoices;

@property TitleVC *parent;

@property NSString *advChef;
@property NSString *advPrepTime;
@property NSString *advCookTime;
@property NSString *advDietary;

- (IBAction)clickReset:(id)sender;

@end
