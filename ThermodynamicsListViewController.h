//
//  ThermodynamicsListViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "CMPopTipView.h"
@interface ThermodynamicsListViewController : UITableViewController <MBProgressHUDDelegate,CMPopTipViewDelegate,UISearchBarDelegate,UITableViewDelegate>

@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) CMPopTipView *pop;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *allItems;
@property (strong, nonatomic) NSMutableArray *displayItems;
@property (nonatomic)         BOOL shownTip;


@end
