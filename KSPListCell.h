//
//  KSPListCell.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Substance_With_Ksp;
@interface KSPListCell : UITableViewCell
@property (strong, nonatomic) UIButton *starred;

@property (strong, nonatomic) UIImage *designatedImage;
@property (strong, nonatomic) UIImageView *equationImageView;
@property (strong, nonatomic) UILabel *labelKsp;
@property (strong, nonatomic) UILabel *labelpKsp;
@property (strong, nonatomic) Substance_With_Ksp *substance;
@property (strong, nonatomic) Substance_With_Ksp *current;
@end
