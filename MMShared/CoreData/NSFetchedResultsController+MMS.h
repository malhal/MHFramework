//
//  NSFetchedResultsController+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 07/12/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFetchedResultsController (MMS)

- (BOOL)mms_isValidIndexPath:(NSIndexPath *)indexPath;

- (id)mms_objectNearIndexPath:(NSIndexPath *)indexPath;

- (void)mms_setDelegateNotifyingParent:(id<NSFetchedResultsControllerDelegate>)delegate;

@property (weak, nonatomic, setter=mms_setParentFetchedResultsController:) NSFetchedResultsController *mms_parentFetchedResultsController;

@end

NS_ASSUME_NONNULL_END
