//
//  advancedVC.h
//  Cooking App
//
//  Created by yuming on 15/10/13.
//  Copyright (c) 2013 Tristan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface advancedVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
    NSMutableArray *chefArray;
    NSMutableArray *prepArray;
    NSMutableArray *cookArray;
    NSMutableArray *dietaryArray;    
    NSMutableArray *advancedArray;
}
@property (weak, nonatomic) IBOutlet UITableView *advancedTableView;


@end
