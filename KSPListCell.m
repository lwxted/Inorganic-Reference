//
//  KSPListCell.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "KSPListCell.h"
#import "Substance_With_Ksp.h"

#define HEIGHT_OF_CELL 40
#define HEIGHT_OF_CELL_INSIDE 55

#define RESIZE 0.85

@implementation KSPListCell

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
    if (!IS_IPHONE_5) {
        self.equationImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.equationImageView];
        self.labelKsp = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelKsp];
        self.labelpKsp = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelpKsp];
        self.starred = [[UIButton alloc] init];
        [self.contentView addSubview:self.starred];
    } else {
        self.labelKsp = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelKsp];
        self.labelpKsp = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelpKsp];
        self.starred = [[UIButton alloc] init];
        [self.contentView addSubview:self.starred];
        self.equationImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.equationImageView];
    }
}

- (void) setDesignatedImage:(UIImage *)designatedImage
{
    if (IS_IPHONE_5) {
        self.starred.frame = CGRectMake(532, 4, 30, 30);
        self.starred.contentMode = UIViewContentModeCenter;

    } else {
        self.starred.frame = CGRectMake(444, 4, 30, 30);
        self.starred.contentMode = UIViewContentModeCenter;

    }
    CGSize size = designatedImage.size;
    if (IS_IPHONE_5) {
        self.equationImageView.frame = CGRectMake(10, (HEIGHT_OF_CELL-.7*size.height)/2, .7*size.width, .7*size.height);
    } else {
        self.equationImageView.frame = CGRectMake(10, (HEIGHT_OF_CELL-.65*size.height)/2, .65*size.width, .65*size.height);
    }
        
        self.equationImageView.image = designatedImage;
        self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
        if (IS_IPHONE_5) {
            self.labelKsp.frame = CGRectMake(173, 9, 200, 21);
        } else {
            self.labelKsp.frame = CGRectMake(148, 9, 200, 20);
        }
        self.labelKsp.font = [UIFont boldSystemFontOfSize:16];
    self.labelKsp.font = [UIFont fontWithName:@"Avenir-Medium" size:18];
        self.labelKsp.textAlignment = UITextAlignmentCenter;
        self.labelKsp.textColor = [UIColor darkGrayColor];
    NSArray *array = [self.substance.ksp componentsSeparatedByString:@"10-"];
    self.labelKsp.text = [NSString stringWithFormat:@"Ksp = %@10%@",[array objectAtIndex:0],[self superscriptConvert:[array objectAtIndex:1]]];
    
    if (IS_IPHONE_5) {
        self.labelpKsp.frame = CGRectMake(420, 9, 106, 21);
    } else {
        self.labelpKsp.frame = CGRectMake(336, 9, 106, 21);
    }
    self.labelpKsp.font = [UIFont fontWithName:@"Avenir-Medium" size:17];
    self.labelpKsp.textAlignment = UITextAlignmentRight;
    self.labelpKsp.textColor = [UIColor darkGrayColor];
    self.labelpKsp.text = [NSString stringWithFormat:@"pKsp = %@", self.substance.pksp ];


    
    
    
    /*
     if (RETINA) {
     //On Retina Displays
     if (size.width <= 630 && size.height <= HEIGHT_OF_CELL) {
     self.equationImageView.frame = CGRectMake(5, (HEIGHT_OF_CELL-size.height)/2, size.width, size.height);
     self.equationImageView.image = designatedImage;
     self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
     } else if (size.width <= 630 && size.height > HEIGHT_OF_CELL) {
     self.equationImageView.frame = CGRectMake(5, 2,size.width,(HEIGHT_OF_CELL-2)/2);
     self.equationImageView.image = designatedImage;
     self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
     } else if (size.width > 630 && size.height <= 630 / RESIZE) {
     self.equationImageView.frame = CGRectMake(5, 5, 630, size.height);
     self.equationImageView.image = designatedImage;
     self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
     } else if (size.width > 630 / RESIZE) {
     self.equationImageView.frame = CGRectMake(5, (HEIGHT_OF_CELL-size.height)/2, 630, size.height);
     self.equationImageView.image = designatedImage;
     self.equationImageView.contentMode = UIViewContentModeScaleAspectFill;
     }
     } else {
     //Not on Retina Displays
     
     }
     */
    
}

- (NSString *) superscriptConvert:(NSString *)input
{
    NSString *output = input;
    for (int i = 0 ; i < input.length; i++) {
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"-"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u207B"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"0"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2070"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"1"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u00B9"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"2"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u00B2"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"3"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u00B3"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"4"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2074"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"5"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2075"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"6"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2076"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"7"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2077"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"8"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2078"];
        }
        if ([[output substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"9"]) {
            output = [output stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"\u2079"];
        }
    }
    return output;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
