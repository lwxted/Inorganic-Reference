//
//  ThermodynamicsListCell.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Thermodynamics_Data;
@interface ThermodynamicsListCell : UITableViewCell
@property (strong, nonatomic) UIImage *designatedImage;
@property (strong, nonatomic) UIImageView *equationImageView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *labelChinese;
@property (strong, nonatomic) Thermodynamics_Data *thermodynamics;
@property (nonatomic) BOOL inside;
@property (strong, nonatomic) Thermodynamics_Data *current;
@property (strong, nonatomic) UIButton *starred;

@end
