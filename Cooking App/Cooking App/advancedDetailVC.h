//
//  advancedDetailVC.h
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class advancedVC;

@interface advancedDetailVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *detailArray;
@property (strong, nonatomic) advancedVC *parent;

@end
