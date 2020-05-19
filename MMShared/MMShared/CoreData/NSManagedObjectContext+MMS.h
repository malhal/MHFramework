//
//  NSManagedObjectContext+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObjectContext (MMS)

// returns a main queue context using the default persistent store coordinator.
// exceptions if fails to create the store.
//+ (instancetype)mms_defaultContext;

// Creates a new managed object context associated with a private queue.
// Designed to work on a context that already has an SQLite store added because it creates a new coordinator with the same URL.
- (NSManagedObjectContext *)mms_newBackgroundContextWithError:(NSError **)error;

// creates a child context with the same concurrency type.
- (NSManagedObjectContext *)mms_newChildContext;

// exceptions if entity does not exist
//- (NSManagedObject*)mms_insertNewObjectForEntityName:(NSString *)name;

//- (NSEntityDescription*)mms_entityDescriptionForName:(NSString *)name;

// check for nil array on error.
//- (NSArray *)mms_fetchObjectsWithEntityName:(NSString *)entityName predicate:(nullable NSPredicate*)predicate error:(NSError **)error;

// dictionary of keys and values that an and predicate will be used. Include NSNull for null values in the query.
//- (NSArray *)mms_fetchObjectsWithEntityName:(NSString *)entityName dictionary:(NSDictionary*)dictionary error:(NSError **)error;

// If there was an error fetching the error is set and nil is returned. If in an insert is required an object will always be returned with no error.
//- (NSManagedObject *)mms_fetchOrInsertObjectWithEntityName:(NSString *)entityName dictionary:(NSDictionary *)dictionary inserted:(BOOL *)inserted error:(NSError **)error;

// errors if not found
//- (NSManagedObject *)mms_existingObjectWithEntityName:(NSString *)entityName dictionary:(NSDictionary *)dictionary error:(NSError **)error;

// errors if not found
//- (NSManagedObject *)mms_existingObjectWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError **)error;

- (BOOL)mms_saveRollbackOnError:(NSError **)error;

// function is one of the predefined NSExpression functions, e.g. max: sum: etc. Returns nil if there is no value.
//- (id)mms_fetchValueForAggregateFunction:(NSString *)function attributeName:(NSString *)attributeName entityName:(NSString *)entityName predicate:(nullable NSPredicate *)predicate error:(NSError **)error;

@property (nonatomic, setter=mms_setAutomaticallyMergesChangesFromParent:) BOOL mms_automaticallyMergesChangesFromParent;

// This wait so that the next operation in the queue doesn't start too soon.
- (NSOperation *)mms_operationPerformingBlockAndWait:(void (^)(void))block;

// when saving a context into its parent, if it errors this method allows you to automatically undo the changes.
//- (BOOL)mms_saveUndoParentOnError:(NSError **)error;

//@property (strong, nonatomic) NSString *debugName;
- (BOOL)mms_save;
- (BOOL)mms_saveWithLogDescription:(nullable NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

// assumed to exist
- (__kindof NSManagedObject *)mms_objectWithURI:(NSURL *)URI;

// returns nil if doesn't exist.
- (nullable __kindof NSManagedObject *)mms_existingObjectWithURI:(NSURL *)objectURI error:(NSError**)error;



@end

NS_ASSUME_NONNULL_END
