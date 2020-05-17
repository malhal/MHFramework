//
//  NSEntityDescription+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSEntityDescription (MMS)

@property (readonly, copy) NSDictionary<NSString *, NSRelationshipDescription *> *mms_toManyRelationshipsByName;

@property (readonly, copy) NSDictionary<NSString *, NSRelationshipDescription *> *mms_toOneRelationshipsByName;

// test
- (NSArray<NSRelationshipDescription *> *)mms_relationshipsWithManagedObjectClass:(Class)managedObjectClass;

// convenience for getting only relations that have toMany true.
- (NSArray *)mms_toManyRelationships;

- (NSArray *)mms_toOneRelationships;

// e.g. if this entity is FruitType it would return fruitTypes. It lowercases first letter and appends an 's'. Todo move to camelCaseAndPluralize
- (NSString *)mms_propertyNameForToManyRelation;

- (NSArray *)mms_transientProperties;

@end

NS_ASSUME_NONNULL_END
