//
//  MMSManagedObjectChangeController.h
//  MMShared
//
//  Created by Malcolm Hall on 11/08/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

typedef NS_ENUM(NSUInteger, MMSManagedObjectChangeType) {
    MMSManagedObjectChangeInsert = 1,
    MMSManagedObjectChangeDelete = 2,
    MMSManagedObjectChangeUpdate = 3
};

NS_ASSUME_NONNULL_BEGIN

@protocol MMSManagedObjectChangeControllerDelegate;

@interface MMSManagedObjectChangeController : NSObject

- (instancetype)initWithManagedObject:(NSManagedObject *)managedObject managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@property (weak, nonatomic) id<MMSManagedObjectChangeControllerDelegate> delegate;

//@property (assign, nonatomic, readonly) BOOL isDeleted;

@end

@protocol MMSManagedObjectChangeControllerDelegate <NSObject>

- (void)controller:(MMSManagedObjectChangeController *)controller didChange:(MMSManagedObjectChangeType)type;

@end

NS_ASSUME_NONNULL_END
