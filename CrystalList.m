//
//  CrystalList.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-4.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "CrystalList.h"
#import "Crystal.h"
#define HEIGHT_OF_CELL 40
#define HEIGHT_OF_CELL_INSIDE 55

#define RESIZE 0.85

@implementation CrystalList

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
    self.equationImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.equationImageView];
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview:self.label];
    self.starred = [[UIButton alloc] init];
    [self.contentView addSubview:self.starred];
}

- (void) setDesignatedImage:(UIImage *)designatedImage
{
    if (IS_IPHONE_5) {
        self.starred.frame = CGRectMake(512, 4, 30, 30);
        self.starred.contentMode = UIViewContentModeCenter;
    } else {
        self.starred.frame = CGRectMake(424, 4, 30, 30);
        self.starred.contentMode = UIViewContentModeCenter;

    }
    CGSize size = designatedImage.size;
    if (!self.inside) {
        self.equationImageView.frame = CGRectMake(10, (HEIGHT_OF_CELL-.65*size.height)/2, .65*size.width, .65*size.height);
        self.equationImageView.image = designatedImage;
        self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
        if (IS_IPHONE_5) {
            self.label.frame = CGRectMake(310, 2, 200, 36);
        } else {
            self.label.frame = CGRectMake(218, 2, 200, 36);
        }
        self.label.font = [UIFont systemFontOfSize:14];
        self.label.textAlignment = UITextAlignmentRight;
        self.label.textColor = [UIColor darkGrayColor];
        self.label.text = [NSString stringWithFormat:@"Molar mass : %@", [NSString stringWithFormat:@"%.2f",[self.crystal.molar_mass floatValue]]];
    } else {
        if (IS_IPHONE_5) {
            self.equationImageView.frame = CGRectMake(2, (HEIGHT_OF_CELL_INSIDE-1*size.height)/2, 546, 1*size.height);
            self.equationImageView.image = designatedImage;
            self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
        } else {
            self.equationImageView.frame = CGRectMake(2, (HEIGHT_OF_CELL_INSIDE-1*size.height)/2, 458, 1*size.height);
            self.equationImageView.image = designatedImage;
            self.equationImageView.contentMode = UIViewContentModeScaleAspectFit;
        }

    }
    
    
    
    
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
