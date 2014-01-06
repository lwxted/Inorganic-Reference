//
//  CrystalList.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Crystal;
@interface CrystalList : UITableViewCell
@property (strong, nonatomic) UIButton *starred;

@property (strong, nonatomic) UIImage *designatedImage;
@property (strong, nonatomic) UIImageView *equationImageView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) Crystal *crystal;
@property (strong, nonatomic) Crystal *current;
@property (nonatomic) BOOL inside;
@end
