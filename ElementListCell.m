//
//  ElementListCell.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "ElementListCell.h"

@implementation ElementListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib
{
    self.element = [[UILabel alloc] init];
    [self.contentView addSubview:self.element];
    self.atomicNumber = [[UILabel alloc] init];
    [self.contentView addSubview:self.atomicNumber];
    self.chineseName = [[UILabel alloc] init];
    [self.contentView addSubview:self.chineseName];
    self.atomicMass = [[UILabel alloc] init];
    [self.contentView addSubview:self.atomicMass];
    self.starred = [[UIButton alloc] init];
    [self.contentView addSubview:self.starred];
}


- (void) awake
{
    if (IS_IPHONE_5) {
        self.starred.frame = CGRectMake(512, 14, 30, 30);
        self.starred.contentMode = UIViewContentModeCenter;

    } else {
        self.starred.frame = CGRectMake(424, 14, 30, 30);
        self.starred.contentMode = UIViewContentModeCenter;

    }
    
    self.element.text = self.elementString;
    self.element.font = [UIFont boldSystemFontOfSize:35];
    self.element.textColor = [UIColor colorWithRed:0.14f green:0.32f blue:0.71f alpha:1.00f];
    self.element.textAlignment = UITextAlignmentCenter;
    self.element.frame = CGRectMake(40, 8, 75, 45);
    
    
    self.atomicNumber.text = self.atomicNumberString;
    self.atomicNumber.font = [UIFont systemFontOfSize:17];
    self.atomicNumber.textColor = [UIColor colorWithRed:0.41f green:0.41f blue:0.41f alpha:1.00f];
    self.atomicNumber.textAlignment = UITextAlignmentRight;
    self.atomicNumber.frame = CGRectMake(6, 8, 32, 45);
    
    
    
    self.chineseName.text = self.chineseNameString;
    self.chineseName.textColor = [UIColor grayColor];
    self.chineseName.font = [UIFont systemFontOfSize:14];
    self.chineseName.textAlignment = UITextAlignmentLeft;
    self.chineseName.frame = CGRectMake(120, 8, 200, 21);
    
    
    
    self.atomicMass.text = self.atomicMassString;
    self.atomicMass.font = [UIFont systemFontOfSize:14];
    self.atomicMass.textColor = [UIColor grayColor  ];
    self.atomicMass.textAlignment = UITextAlignmentLeft ;
    self.atomicMass.frame = CGRectMake(125, 32, 200, 21);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
