//
//  TableDataSource.h
//  ScrollPosition
//
//  Created by Malcolm Hall on 09/04/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMSFetchedResultsTableViewController<NSObject>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong, null_resettable) UITableView *tableView;

- (void)updateCell:(UITableViewCell *)cell withObject:(id)object;

@end

NS_ASSUME_NONNULL_END
