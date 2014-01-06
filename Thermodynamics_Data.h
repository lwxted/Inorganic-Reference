//
//  Thermodynamics_Data.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Thermodynamics_Data : NSManagedObject

@property (nonatomic, retain) NSString * enthalpy;
@property (nonatomic, retain) NSString * entropy;
@property (nonatomic, retain) NSString * formula;
@property (nonatomic, retain) NSString * gibbs;
@property (nonatomic, retain) NSString * heat_capacity;
@property (nonatomic, retain) id image_data;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSNumber * tag;
@property (nonatomic, retain) NSNumber * starred;

@end
