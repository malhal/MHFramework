//
//  MMSTableViewFetchedResultsControllerUpdater.h
//  MMShared
//
//  Created by Malcolm Hall on 21/05/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSTableViewFetchedResultsController;

@interface MMSFetchedResultsTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) MMSTableViewFetchedResultsController *tableViewFetchedResultsController;

@end

NS_ASSUME_NONNULL_END
