//
//  NSDictionary+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 18/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (MMS)

@property (readonly, copy) NSArray<KeyType> *mms_allKeysSet;

// when fetching related data from core data using NSDictionaryResultType the dictionary keys are flat key paths
// e.g. {app.bundleIdentifier : ...} instead of {app : {bundleIdentifier : ...}}
// this method converts the flat keys into nested dictionaries.
@property (readonly, copy) NSDictionary<KeyType, ObjectType> *mms_unflattenDictionary;

//- (NSArray<ObjectType> *)mms_objectsForKnownKeys:(NSArray<KeyType> *)keys;

- (instancetype)mms_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary;

- (nullable ObjectType)mms_nilIfNSNullObjectForKey:(id)aKey;

- (NSString *)mms_prettyDescriptionWithTabLevel:(NSUInteger)tabLevel;

@end

NS_ASSUME_NONNULL_END
