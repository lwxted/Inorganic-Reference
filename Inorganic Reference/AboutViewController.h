//
//  AboutViewController.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-5.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *dismiss;
- (IBAction)dismissed:(id)sender;
- (IBAction)weibo:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *weiboButton;
@property (strong, nonatomic) IBOutlet UIButton *tickButton;
- (IBAction)tick:(id)sender;
- (IBAction)facebook:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *facebookButton;
- (IBAction)twitter:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *twitterButton;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end
