//
//  NSFetchedResultsController+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 07/12/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "NSFetchedResultsController+MMS.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSFetchedResultsController (MMS)

- (BOOL)mms_isValidIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row >= 0 && indexPath.section < self.sections.count){
        id <NSFetchedResultsSectionInfo> sectionInfo = self.sections[indexPath.section];
        if(indexPath.row >= 0 && indexPath.row < sectionInfo.numberOfObjects){
            return YES;
        }
    }
    return NO;
}

// not needed
- (NSIndexPath *)mms_objectNearIndexPath:(NSIndexPath *)indexPath{
    // NSAssert(!self.tableView.isEditing, @"Cannot select while editing");
    NSUInteger count = self.sections[indexPath.section].numberOfObjects;// [self numberOfRowsInSection:indexPath.section] ;//self.fetchedResultsController.fetchedObjects.count;
    //id item;
    NSIndexPath *newIndexPath;
    if(!count){
        return nil;
    }
    NSUInteger row = count - 1;
    if(indexPath.row < row){
        row = indexPath.row;
    }
    newIndexPath = [NSIndexPath indexPathForRow:row inSection:indexPath.section];
    return [self objectAtIndexPath:newIndexPath];
}

//we need this delegate to be first in the list
- (void)mms_setDelegateNotifyingParent:(id<NSFetchedResultsControllerDelegate>)delegate{
    self.delegate = delegate;
    [self.mms_parentFetchedResultsController mms_childDelegateUpdated];
}

- (void)mms_childDelegateUpdated{
    id delegate = self.delegate;
    self.delegate = nil;
    self.delegate = delegate;
    [self.mms_parentFetchedResultsController mms_childDelegateUpdated];
}

- (NSFetchedResultsController *)mms_parentFetchedResultsController{
    return objc_getAssociatedObject(self, @selector(mms_parentFetchedResultsController));
}

- (void)mms_setParentFetchedResultsController:(NSFetchedResultsController *)frc {
    objc_setAssociatedObject(self, @selector(mms_parentFetchedResultsController), frc, OBJC_ASSOCIATION_ASSIGN);
    [self mms_childDelegateUpdated];
}


@end
