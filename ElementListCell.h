//
//  ElementListCell.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Element;
@interface ElementListCell : UITableViewCell

@property (strong, nonatomic) UILabel *element;
@property (strong, nonatomic) NSString *elementString;
@property (strong, nonatomic) UILabel *atomicNumber;
@property (strong, nonatomic) NSString *atomicNumberString;
@property (strong, nonatomic) NSString *chineseNameString;;
@property (strong, nonatomic) UILabel *chineseName;
@property (strong, nonatomic) UILabel *atomicMass;
@property (strong, nonatomic) NSString *atomicMassString;
@property (strong, nonatomic) UIButton *starred;
@property (strong, nonatomic) Element * current;
@property (nonatomic)         BOOL inside;


- (void) awake;
@end
