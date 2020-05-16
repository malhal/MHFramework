//
//  NSPersistentStoreCoordinator+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSNSPersistentStoreDescription, MMSPersistentContainer;

@interface NSPersistentStoreCoordinator (MMS)

// returns a shared instance of a coordinator using the mms_defaultManagedObjectModel and mms_defaultSQLiteStoreURL.

+ (NSPersistentStoreCoordinator *)mms_defaultCoordinatorWithError:(NSError **)error;

// returns a new instance of a coordinator using the mms_defaultManagedObjectModel and mms_defaultSQLiteStoreURL.
//+ (NSPersistentStoreCoordinator*)mms_coordinator;

// returns a new instance of a coordinator using the supplied model and mms_defaultSQLiteStoreURL.
//+ (NSPersistentStoreCoordinator*)mms_coordinatorWithManagedObjectModel:(NSManagedObjectModel *)model;

// convenience for creating a coordinator with a sqlite store already added.

+ (NSPersistentStoreCoordinator *)mms_coordinatorWithManagedObjectModel:(NSManagedObjectModel *)model storeURL:(NSURL *)storeURL error:(NSError **)error;

// Adds a sqlite store at the url with default options.
- (NSPersistentStore *)mms_addStoreWithURL:(NSURL *)storeURL error:(NSError **)error;

// Returns a URL path within Application Support/Executable Name/Bundle ID.sqlite creating directories as necessary.
+ (NSURL *)mms_defaultStoreURLWithError:(NSError **)error;

// Returns the Bundle ID.sqlite
@property (class, readonly, strong) NSString *mms_defaultStoreFilename;

// Returns the path to Application Support/Executable Name creating directories as necessary.
+ (NSURL *)mms_applicationSupportDirectoryWithError:(NSError **)error;

- (void)mms_addPersistentStoreWithDescription:(MMSNSPersistentStoreDescription *)storeDescription completionHandler:(void (^)(MMSNSPersistentStoreDescription *, NSError * _Nullable))block;

// convenience
- (BOOL)mms_destroyPersistentStore:(NSPersistentStore *)store error:(NSError * _Nullable __autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
