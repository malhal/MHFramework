//
//  NSManagedObject+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObject (MMS)

// getter
- (id)objectForKeyedSubscript:(NSString *)key;

// setter
- (void)setObject:(id)object forKeyedSubscript:(id<NSCopying>)key;

// finds the entity that has this class's name as its managedObjectClassName.
- (instancetype)mms_initWithContext:(NSManagedObjectContext *)context;

+ (instancetype)mms_objectFromObjectID:(NSManagedObjectID *)objectID context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectIDsFromObjects:(NSArray *)objects;
+ (NSArray *)mms_objectIDsMatchingPredicate:(NSPredicate *)predicate context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectIDsMatchingPredicate:(NSPredicate *)predicate sortDescriptors:(nullable NSArray *)sortDescriptors context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectsFromObjectIDs:(NSArray *)objectIDs context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectsFromObjectIDs:(NSArray *)objectIDs relationshipKeyPathsForPrefetching:(nullable NSArray *)keyPaths context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectsMatchingPredicate:(nullable NSPredicate *)predicate context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectsMatchingPredicate:(nullable NSPredicate *)predicate sortDescriptors:(nullable NSArray *)sortDescriptors context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_objectsMatchingPredicate:(nullable NSPredicate *)predicate sortDescriptors:(nullable NSArray *)sortDescriptors relationshipKeyPathsForPrefetching:(nullable NSArray *)keyPaths context:(NSManagedObjectContext *)context;
+ (NSArray *)mms_permanentObjectIDsFromObjects:(NSArray *)objects;
+ (NSArray *)mms_resultsMatchingPredicate:(NSPredicate *)predicate sortDescriptors:(nullable NSArray *)sortDescriptors resultType:(NSFetchRequestResultType)resultType relationshipKeyPathsForPrefetching:(nullable NSArray *)keyPaths context:(NSManagedObjectContext *)context;
- (BOOL)mms_obtainPermanentObjectIDIfNecessary;
- (NSManagedObjectID *)mms_permanentObjectID;
- (void)mms_postNotificationOnMainThreadAfterSaveWithName:(NSString *)name;
- (void)mms_postNotificationOnMainThreadWithName:(NSString *)name;
+ (NSUInteger)mms_countOfObjectsMatchingPredicate:(NSPredicate *)predicate context:(NSManagedObjectContext *)context;

// new
+ (NSFetchRequest *)mms_fetchRequestWithPredicate:(NSPredicate *)predicate;

@property (assign, nonatomic, readonly) BOOL mms_isReallyDeleted;



@end

NS_ASSUME_NONNULL_END
