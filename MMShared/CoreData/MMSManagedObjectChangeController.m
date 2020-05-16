//
//  MMSManagedObjectChangeController.m
//  MMShared
//
//  Created by Malcolm Hall on 11/08/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "MMSManagedObjectChangeController.h"

@interface MMSManagedObjectChangeController()

@property (strong, nonatomic) NSManagedObject *managedObject;

@end

@implementation MMSManagedObjectChangeController

- (instancetype)initWithManagedObject:(NSManagedObject *)managedObject managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    NSAssert(managedObject, @"managedObject cannot be nil");
    NSAssert(managedObjectContext, @"managedObjectContext cannot be nil");
    self = [super init];
    if (self) {
        _managedObject = managedObject;
        //_isDeleted = [managedObjectContext.deletedObjects containsObject:managedObject];
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(managedObjectContextObjectsDidChangeNotification:) name:NSManagedObjectContextObjectsDidChangeNotification object:managedObjectContext];
    }
    return self;
}

- (void)managedObjectContextObjectsDidChangeNotification:(NSNotification *)notification{
    if([notification.userInfo[NSInsertedObjectsKey] containsObject:self.managedObject]){
        [self notifyDidChange:MMSManagedObjectChangeInsert];
    }
    if([notification.userInfo[NSUpdatedObjectsKey] containsObject:self.managedObject]){
        [self notifyDidChange:MMSManagedObjectChangeUpdate];
    }
    if([notification.userInfo[NSDeletedObjectsKey] containsObject:self.managedObject]){
        //self.isDeleted = YES;
        [self notifyDidChange:MMSManagedObjectChangeDelete];
    }
}

//- (void)setIsDeleted:(BOOL)isDeleted{
//    if(_isDeleted == isDeleted){
//        return;
//    }
//    _isDeleted = isDeleted;
//    [self notifyDidChange:MMSManagedObjectChangeDelete];
//}

- (void)notifyDidChange:(MMSManagedObjectChangeType)type{
    if([self.delegate respondsToSelector:@selector(controller:didChange:)]){
        [self.delegate controller:self didChange:type];
    }
}

@end
