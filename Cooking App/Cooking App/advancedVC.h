//
//  advancedVC.h
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface advancedVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *chefArray;
    NSMutableArray *timeArray;
    NSMutableArray *dietaryArray;
}

@property (weak, nonatomic) IBOutlet UITableView *advancedTableView;

@property (strong, nonatomic) NSMutableDictionary *userChoices;


@end
