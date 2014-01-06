//
//  ThermodynamicsDetailViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Thermodynamics_Data;

@interface ThermodynamicsDetailViewController : UITableViewController

@property (strong, nonatomic) Thermodynamics_Data *thermodynamics;
@property (strong,   nonatomic) NSMutableArray *cells;
@end
