//
//  BookMarkViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BookMarkViewController : UITableViewController <MBProgressHUDDelegate,UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *elements;
@property (strong, nonatomic) NSMutableArray *crystals;
@property (strong, nonatomic) NSMutableArray *ksps;
@property (strong, nonatomic) NSMutableArray *thermos;
@property (strong, nonatomic) NSMutableArray *reactions;
@property (strong, nonatomic) MBProgressHUD *HUD;
@property (nonatomic) int sections;
@property (strong, nonatomic) NSMutableArray *avails;
@property (strong, nonatomic) NSMutableArray *titles;

@end
