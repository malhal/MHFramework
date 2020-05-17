//
//  NSManagedObject+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import "NSManagedObject+MMS.h"
#import "MMSUtilities.h"

@implementation NSManagedObject (MMS)

- (id)objectForKeyedSubscript:(NSString *)key {
    return [self valueForKey:key];
}

- (void)setObject:(id)object forKeyedSubscript:(id<NSCopying>)key {
    NSParameterAssert([(id<NSObject>)key isKindOfClass:[NSString class]]);
    [self setValue:object forKey:(NSString *)key];
}

- (instancetype)mms_initWithContext:(NSManagedObjectContext *)context{
    // search for this class in the model to find the entity
    NSEntityDescription* entity;
    NSString * className = NSStringFromClass(self.class);
    NSPersistentStoreCoordinator *psc = context.persistentStoreCoordinator;
    for(NSEntityDescription* e in psc.managedObjectModel.entities){
        if([e.managedObjectClassName isEqualToString:className]){
            entity = e;
            break;
        }
        // we won't check if there are any more matches
    }
    if(!entity){
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Could not find an entity for this class" userInfo:nil];
    }
    return [self initWithEntity:entity insertIntoManagedObjectContext:context];
}

+ (instancetype)mms_objectFromObjectID:(NSManagedObjectID *)objectID context:(NSManagedObjectContext *)context{
    if(!objectID){
        NSLog(@"Trying to get an object from a nil object ID: %@", [NSThread callStackSymbols]);
        return nil;
    }
    NSError *error;
    NSManagedObject *object = [context existingObjectWithID:objectID error:&error];
//    if(![object isKindOfClass:self.class]){
//        NSLog(@"Unexpected object type in checked dynamic cast %@ expects %@", object.class, self.class);
//        object = nil;
//    }
    object = MMSCheckedDynamicCast(self.class, object);
    if(error){
        if(error.code == NSManagedObjectReferentialIntegrityError){
            NSLog(@"Unable to find object from objectID: %@", objectID);
        }
        else{
            NSLog(@"Error finding object from objectID: %@, %@", objectID, error);
        }
    }
    return object;
}

+ (NSArray *)mms_objectIDsFromObjects:(NSArray *)objects{
    NSMutableArray *objectIDs = [NSMutableArray array];
    for(NSManagedObject *object in objects){
        NSManagedObjectID *objectID = object.objectID;
        if(objectID){
            [objectIDs addObject:objectID];
        }
    }
    return objectIDs;
}

+ (NSArray *)mms_objectIDsMatchingPredicate:(NSPredicate *)predicate context:(NSManagedObjectContext *)context{
    return [self mms_objectIDsMatchingPredicate:predicate sortDescriptors:nil context:context];
}

+ (NSArray *)mms_objectIDsMatchingPredicate:(NSPredicate *)predicate sortDescriptors:(nullable NSArray *)sortDescriptors context:(NSManagedObjectContext *)context{
    return [self mms_resultsMatchingPredicate:predicate sortDescriptors:sortDescriptors resultType:NSManagedObjectIDResultType relationshipKeyPathsForPrefetching:nil context:context];
}

+ (NSArray *)mms_objectsFromObjectIDs:(NSArray *)objectIDs context:(NSManagedObjectContext *)context{
    return [self mms_objectsFromObjectIDs:objectIDs relationshipKeyPathsForPrefetching:nil context:context];
}

+ (NSArray *)mms_objectsFromObjectIDs:(NSArray *)objectIDs relationshipKeyPathsForPrefetching:(nullable NSArray *)keyPaths context:(NSManagedObjectContext *)context{
    NSFetchRequest *fr = self.fetchRequest;//[NSFetchRequest fetchRequestWithEntityName:self.entity.name];
    fr.includesSubentities = YES;
    fr.predicate = [NSPredicate predicateWithFormat:@"SELF in %@", objectIDs];
    fr.relationshipKeyPathsForPrefetching = keyPaths;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:fr error:&error];
    if(error){
        NSLog(@"Error fetching objects from (%ld) object IDs: %@", (unsigned long)objectIDs.count, error);
    }
    return objects;
}

+ (NSArray *)mms_objectsMatchingPredicate:(NSPredicate *)predicate context:(NSManagedObjectContext *)context{
    return [self mms_objectsMatchingPredicate:predicate sortDescriptors:nil context:context];
}

+ (NSArray *)mms_objectsMatchingPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors context:(NSManagedObjectContext *)context{
    __block NSFetchRequest *fetchRequest = self.fetchRequest;
    if(!fetchRequest){
        [context performBlockAndWait:^{
            fetchRequest = self.fetchRequest;
        }];
    }
    fetchRequest.predicate = predicate;
    fetchRequest.sortDescriptors = sortDescriptors;
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if(error){
        NSLog(@"Error fetching %@ (predicate=%@ sortDescriptors=%@): %@", self.class, predicate, sortDescriptors, error);
    }
    else if(!results){
        NSLog(@"Nil objects array fetching %@ (predicate=%@ sortDescriptors=%@ context=%@)", self.class, predicate, sortDescriptors, context);
    }
    return results;
}

+ (NSArray *)mms_objectsMatchingPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors relationshipKeyPathsForPrefetching:(nullable NSArray *)keyPaths context:(NSManagedObjectContext *)context{
    return [self mms_resultsMatchingPredicate:predicate sortDescriptors:sortDescriptors resultType:NSManagedObjectResultType relationshipKeyPathsForPrefetching:keyPaths context:context];
}

+ (NSArray *)mms_permanentObjectIDsFromObjects:(NSArray *)objects{
    NSManagedObject *object = objects.firstObject;
    if(object){
        NSIndexSet *set = [objects indexesOfObjectsPassingTest:^BOOL(NSManagedObject *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return obj.objectID.isTemporaryID;
        }];
        NSArray *objectsWithTemporaryIDs = [objects objectsAtIndexes:set];
        NSError *error;
        if(![object.managedObjectContext obtainPermanentIDsForObjects:objectsWithTemporaryIDs error:&error]){
            NSLog(@"Error obtaining permanent object ID for objects with error: %@", error);
        }
    }
    return [self mms_objectIDsFromObjects:objects];
}

+ (NSArray *)mms_resultsMatchingPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors resultType:(NSFetchRequestResultType)resultType relationshipKeyPathsForPrefetching:(nullable NSArray *)keyPaths context:(NSManagedObjectContext *)context{
    __block NSFetchRequest *fetchRequest = self.fetchRequest;
    if(!fetchRequest){
        [context performBlockAndWait:^{
            fetchRequest = self.fetchRequest;
        }];
    }
    fetchRequest.predicate = predicate;
    fetchRequest.resultType = resultType;
    fetchRequest.sortDescriptors = sortDescriptors;
    fetchRequest.relationshipKeyPathsForPrefetching = keyPaths;
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if(error){
        NSLog(@"Error fetching %@ (predicate=%@ sortDescriptors=%@): %@", self.class, predicate, sortDescriptors, error);
    }
    else if(!results){
        NSLog(@"Nil objects array fetching %@ (predicate=%@ sortDescriptors=%@ context=%@)", self.class, predicate, sortDescriptors, context);
    }
    return results;
}

- (BOOL)mms_obtainPermanentObjectIDIfNecessary{
    if(!self.objectID.isTemporaryID){
        return YES;
    }
    NSError *error;
    if(![self.managedObjectContext obtainPermanentIDsForObjects:@[self] error:&error]){
        NSLog(@"Error obtaining permanent object ID for %@: %@", self.class, error);
        return NO;
    }
    return YES;
}

- (NSManagedObjectID *)mms_permanentObjectID{
    [self mms_obtainPermanentObjectIDIfNecessary];
    return self.objectID;
}

- (void)mms_postNotificationOnMainThreadAfterSaveWithName:(NSString *)name{
    __weak typeof(self) weakSelf = self;
    [NSNotificationCenter.defaultCenter addObserverForName:NSManagedObjectContextDidSaveNotification object:self.managedObjectContext queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSManagedObjectID *objectID = strongSelf.mms_permanentObjectID;
        if(objectID){
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSNotificationCenter.defaultCenter postNotificationName:name object:objectID];
            });
        }
        [NSNotificationCenter.defaultCenter removeObserver:strongSelf];
    }];
}

- (void)mms_postNotificationOnMainThreadWithName:(NSString *)name{
    NSManagedObjectContext *context = self.managedObjectContext;
    __weak typeof(self) weakSelf = self;
    [context performBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSManagedObjectID *objectID = strongSelf.mms_permanentObjectID;
        if(objectID){
            dispatch_async(dispatch_get_main_queue(), ^{
                [NSNotificationCenter.defaultCenter postNotificationName:name object:objectID];
            });
        }
    }];
}

+ (NSUInteger)mms_countOfObjectsMatchingPredicate:(NSPredicate *)predicate context:(NSManagedObjectContext *)context{
    NSFetchRequest *fetchRequest = self.fetchRequest;
    fetchRequest.predicate = predicate;
    NSError *error;
    NSUInteger result = [context countForFetchRequest:fetchRequest error:&error];
    if(result == NSNotFound){
        NSLog(@"Error counting objects matching predicate %@: %@", predicate, error);
        result = 0;
    }
    return result;
}

+ (NSFetchRequest *)mms_fetchRequestWithPredicate:(NSPredicate *)predicate{
    NSFetchRequest *fr = self.fetchRequest;
    fr.predicate = predicate;
    return fr;
}

// maybe wrong
- (BOOL)mms_isReallyDeleted{
    return self.isDeleted || !self.managedObjectContext;
}

@end
