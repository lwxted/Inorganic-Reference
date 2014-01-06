//
//  Star.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "Star.h"

@implementation Star
@synthesize hitOffsetTop;
@synthesize hitOffsetBottom;
@synthesize hitOffsetLeft;
@synthesize hitOffsetRight;

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    //Calculate offsets from buttons bounds
    hitOffsetBottom = hitOffsetTop = hitOffsetLeft = hitOffsetRight = 10;
    bounds = CGRectMake(bounds.origin.x - hitOffsetLeft,
                        bounds.origin.y - hitOffsetTop,
                        bounds.size.width + hitOffsetLeft + hitOffsetRight,
                        bounds.size.height + hitOffsetTop + hitOffsetBottom);
    
    return CGRectContainsPoint(bounds, point);
}

@end
