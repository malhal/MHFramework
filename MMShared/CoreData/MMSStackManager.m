//
//  MMSStackManager.m
//  MMShared
//
//  Created by Malcolm Hall on 08/02/2016.
//
//

#import "MMSStackManager.h"
#import "NSManagedObjectModel+MMS.h"
#import "NSPersistentStoreCoordinator+MMS.h"

@interface MMSStackManager()

@property (nonatomic, readwrite) NSManagedObjectContext *mainContext;

@end

@implementation MMSStackManager

+ (instancetype)sharedManager {
    static MMSStackManager *sharedManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [self.alloc init];
    });
    return sharedManager;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        _managedObjectModel = [NSManagedObjectModel mms_defaultModel];
    }
    return _managedObjectModel;
}

- (NSURL *)storeURL {
    if (!_storeURL) {
        NSError *error;
        _storeURL = [NSPersistentStoreCoordinator mms_defaultStoreURLWithError:&error];
        if(!_storeURL){
            [NSException raise:NSInternalInconsistencyException format:@"Failed to create store path %@", error];
        }
    }
    return _storeURL;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        NSError *error;
        _persistentStoreCoordinator = [NSPersistentStoreCoordinator mms_coordinatorWithManagedObjectModel:self.managedObjectModel storeURL:self.storeURL error:&error];
        if(!_persistentStoreCoordinator){
            [NSException raise:NSInternalInconsistencyException format:@"Failed to create store %@", error];
        }
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)mainContext{
    if(!_mainContext){
        _mainContext = [NSManagedObjectContext.alloc initWithConcurrencyType:NSMainQueueConcurrencyType];
        _mainContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _mainContext;
}

@end
