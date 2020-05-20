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


@protocol MMSTableViewFetchAdapterCellUpdating;

// TableViewFetchingAdapter
@interface MMSTableViewFetchAdapter<ResultType:id<NSFetchRequestResult>> : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController<ResultType> *fetchedResultsController;

// maybe use this for implementing swipe to delete?
@property (assign, nonatomic) BOOL canDeleteObjects;

@property (weak, nonatomic, readonly) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

//- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)controller;
//- (instancetype)initWithTableView:(UITableView *)tableView;

// defaults to NSObject : Cell
//@property (strong, nonatomic) NSDictionary *cellIdentifiersByClassName;

//@property (weak, nonatomic) id<MMSTableViewFetchAdapterDelegate> delegate;
@property (weak, nonatomic) id<MMSTableViewFetchAdapterCellUpdating> cellUpdater;

// override to return a cell. Default implementation dequeues a @"Cell" identifier.
// configureWithObject will be called on the cell returned from this. B
//- (UITableViewCell<MMSTableViewCellConfiguring> *)cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

@end

@protocol MMSTableViewFetchAdapterCellUpdating <NSObject>

- (void)tableViewFetchAdapter:(MMSTableViewFetchAdapter *)tableViewFetchAdapter updateCell:(UITableViewCell *)cell withObject:(id)object;

@end

//@protocol MMSTableViewFetchAdapterDelegate<NSObject>
//
//@required
//- (void)tableViewFetchAdapter:(MMSTableViewFetchAdapter *)tableViewFetchAdapter configureCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

NS_ASSUME_NONNULL_END
