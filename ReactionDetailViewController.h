//
//  ReactionDetailViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-3.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reaction.h"

@interface ReactionDetailViewController : UITableViewController

@property (strong, nonatomic) NSArray *cells;
@property (strong, nonatomic) Reaction *reaction;
@end
