//
//  Element.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reaction;

@interface Element : NSManagedObject

@property (nonatomic, retain) NSString * atomic_radius;
@property (nonatomic, retain) NSString * boiling_temperature;
@property (nonatomic, retain) NSString * chinese_name;
@property (nonatomic, retain) NSString * common_compounds;
@property (nonatomic, retain) NSString * common_valencey;
@property (nonatomic, retain) NSString * density;
@property (nonatomic, retain) NSString * description_of_element;
@property (nonatomic, retain) NSString * discovered_year;
@property (nonatomic, retain) NSString * discoverer;
@property (nonatomic, retain) NSString * element;
@property (nonatomic, retain) NSString * elementary_substance;
@property (nonatomic, retain) NSString * english_name;
@property (nonatomic, retain) NSString * ionic_radius;
@property (nonatomic, retain) NSString * melt_temperature;
@property (nonatomic, retain) NSString * molar_mass;
@property (nonatomic, retain) NSNumber * molar_number;
@property (nonatomic, retain) NSString * origin;
@property (nonatomic, retain) NSString * origin_of_name;
@property (nonatomic, retain) NSString * overview;
@property (nonatomic, retain) NSString * radio;
@property (nonatomic, retain) NSString * usage;
@property (nonatomic, retain) NSNumber * starred;
@property (nonatomic, retain) NSSet *newRelationship;
@end

@interface Element (CoreDataGeneratedAccessors)

- (void)addNewRelationshipObject:(Reaction *)value;
- (void)removeNewRelationshipObject:(Reaction *)value;
- (void)addNewRelationship:(NSSet *)values;
- (void)removeNewRelationship:(NSSet *)values;

@end
