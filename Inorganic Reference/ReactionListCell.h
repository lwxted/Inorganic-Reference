//
//  ReactionListCell.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-3.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reaction.h"

@interface ReactionListCell : UITableViewCell

@property (strong, nonatomic) UIImageView *equationImageView;
@property (nonatomic)         UIImage *designatedImage;
@property (nonatomic)         BOOL inside;
@property (strong, nonatomic) Reaction *current;
@property (strong, nonatomic) UIButton *starred;

@end
