//
//  ElementListViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "CMPopTipView.h"

@interface ElementListViewController : UITableViewController <MBProgressHUDDelegate,CMPopTipViewDelegate,UISearchBarDelegate,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) CMPopTipView *pop;
@property (strong, nonatomic) __block NSArray *allItems;
@property (strong, nonatomic) __block NSMutableArray *displayItems;
@property (nonatomic) BOOL shownTip;
@property (nonatomic) int current;

@end
