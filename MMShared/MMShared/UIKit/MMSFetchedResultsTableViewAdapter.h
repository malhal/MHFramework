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

@class MMSFetchedResultsTableViewAdapter;
//@protocol MMSFetchedResultsTableViewAdapterDelegate;

@interface MMSFetchedResultsTableViewAdapter<ResultType:id<NSFetchRequestResult>> : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController<ResultType> *fetchedResultsController;

// maybe use this for implementing swipe to delete?
@property (assign, nonatomic) BOOL canDeleteObjects;

@property (weak, nonatomic, readonly) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

//- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)controller;
//- (instancetype)initWithTableView:(UITableView *)tableView;

// defaults to NSObject : Cell
//@property (strong, nonatomic) NSDictionary *cellIdentifiersByClassName;

//@property (weak, nonatomic) id<MMSFetchedResultsTableViewAdapterDelegate> delegate;

//- (UITableViewCell *)cellForObject:(ResultType)object atIndexPath:(NSIndexPath *)indexPath;

//- (void)configureCell:(UITableViewCell *)cell withObject:(ResultType)object;

@end

//@protocol MMSFetchedResultsTableViewAdapterDelegate<NSObject>

//@required
//- (void)fetchedResultsTableViewAdapter:(MMSFetchedResultsTableViewAdapter *)fetchedResultsTableViewAdapter configureCell:(UITableViewCell *)cell withObject:(id)object;

//@end

NS_ASSUME_NONNULL_END
