//
//  Reaction.h
//  Inorganic Reference
//
//  Created by lwxted on 12-10-17.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Element;

@interface Reaction : NSManagedObject

@property (nonatomic, retain) NSString * formula;
@property (nonatomic, retain) NSString * image_address;
@property (nonatomic, retain) id image_data;
@property (nonatomic, retain) NSNumber * image_height;
@property (nonatomic, retain) NSNumber * image_width;
@property (nonatomic, retain) NSString * reaction_condition;
@property (nonatomic, retain) NSString * reaction_description;
@property (nonatomic, retain) NSNumber * tag;
@property (nonatomic, retain) NSNumber * starred;
@property (nonatomic, retain) NSSet *newRelationship;
@end

@interface Reaction (CoreDataGeneratedAccessors)

- (void)addNewRelationshipObject:(Element *)value;
- (void)removeNewRelationshipObject:(Element *)value;
- (void)addNewRelationship:(NSSet *)values;
- (void)removeNewRelationship:(NSSet *)values;

@end
