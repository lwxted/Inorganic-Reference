//
//  Substance_With_Ksp.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Substance_With_Ksp : NSManagedObject

@property (nonatomic, retain) NSString * formula;
@property (nonatomic, retain) id image_data;
@property (nonatomic, retain) NSString * ksp;
@property (nonatomic, retain) NSString * pksp;
@property (nonatomic, retain) NSNumber * tag;
@property (nonatomic, retain) NSNumber * starred;

@end
