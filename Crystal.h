//
//  Crystal.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Crystal : NSManagedObject

@property (nonatomic, retain) NSString * boiling_temperature;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * density;
@property (nonatomic, retain) NSString * form;
@property (nonatomic, retain) NSString * formula;
@property (nonatomic, retain) id image_data;
@property (nonatomic, retain) NSString * melt_temperature;
@property (nonatomic, retain) NSNumber * molar_mass;
@property (nonatomic, retain) NSString * solubility;
@property (nonatomic, retain) NSNumber * tag;
@property (nonatomic, retain) NSNumber * starred;

@end
