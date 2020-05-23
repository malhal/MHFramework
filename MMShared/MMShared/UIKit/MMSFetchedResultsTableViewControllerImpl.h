//
//  TableDataSource.h
//  ScrollPosition
//
//  Created by Malcolm Hall on 09/04/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MMShared/MMSFetchedResultsTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSFetchedResultsTableViewControllerImpl;

@interface MMSFetchedResultsTableViewControllerImpl<ResultType:id<NSFetchRequestResult>> : NSObject<UITableViewDataSource, NSFetchedResultsControllerDelegate>

- (instancetype)initWithTableViewController:(UITableViewController<MMSFetchedResultsTableViewController> *)tableViewController;

@property (weak, nonatomic) UITableViewController<MMSFetchedResultsTableViewController> *tableViewController;

@end

NS_ASSUME_NONNULL_END
