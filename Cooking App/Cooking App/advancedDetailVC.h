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

@property (weak, nonatomic) NSArray *detailArray;
@property (weak, nonatomic) NSString *key;

@property (strong, nonatomic) advancedVC *parent;

@end
