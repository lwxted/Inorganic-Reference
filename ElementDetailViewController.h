//
//  ElementDetailViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Element;
@interface ElementDetailViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *cells;
@property (strong, nonatomic) Element *element;

@end
