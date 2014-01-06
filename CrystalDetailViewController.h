//
//  CrystalDetailViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Crystal;
@interface CrystalDetailViewController : UITableViewController
@property (strong, nonatomic) Crystal *element;
@property (strong, nonatomic) NSMutableArray *cells;
@end
