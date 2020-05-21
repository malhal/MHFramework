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


@protocol MMSTableViewFetchedResultsAdapterCellUpdating;
@class MMSTableViewFetchedResultsAdapter;

@protocol MMSTableViewFetchedResultsAdapterDelegate <NSObject>
@optional
- (void)tableViewFetchedResultsAdapter:(MMSTableViewFetchedResultsAdapter *)tableViewFetchedResultsAdapter configureCell:(UITableViewCell *)cell withObject:(id)object;
- (nullable UITableViewCell *)tableViewFetchedResultsAdapter:(MMSTableViewFetchedResultsAdapter *)tableViewFetchedResultsAdapter cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

@end

// TableViewFetchingAdapter, FetchedResultsViewUpdater // <ResultType:id<NSFetchRequestResult>>
@interface MMSTableViewFetchedResultsAdapter : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate>

//- (instancetype)initWithFetchRequest:(NSFetchRequest<ResultType> *)fetchRequest managedObjectContext: (NSManagedObjectContext *)context sectionNameKeyPath:(nullable NSString *)sectionNameKeyPath cacheName:(nullable NSString *)name tableView:(UITableView *)tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

// maybe use this for implementing swipe to delete?
@property (assign, nonatomic) BOOL canDeleteObjects;

@property (weak, nonatomic, readonly) UITableView *tableView;

//- (instancetype)initWithTableView:(UITableView *)tableView;

//- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)controller;
//- (instancetype)initWithTableView:(UITableView *)tableView;

// defaults to NSObject : Cell
//@property (strong, nonatomic) NSDictionary *cellIdentifiersByClassName;

@property (weak, nonatomic) id<MMSTableViewFetchedResultsAdapterDelegate> delegate;
//@property (weak, nonatomic) id<MMSTableViewFetchedResultsAdapterCellUpdating> cellUpdater;

// override to return a cell. Default implementation dequeues a @"Cell" identifier.
// configureWithObject will be called on the cell returned from this. B
//- (UITableViewCell<MMSTableViewCellConfiguring> *)cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object;

- (UITableViewCell *)cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

@end
//
//@protocol MMSTableViewFetchedResultsAdapterCellUpdating <NSObject>
//
//- (void)fetchedResultsViewUpdater:(MMSTableViewFetchedResultsAdapter *)fetchedResultsViewUpdater updateCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

//@protocol MMSTableViewFetchedResultsAdapterDelegate<NSObject>
//
//@required
//- (void)fetchedResultsViewUpdater:(MMSTableViewFetchedResultsAdapter *)fetchedResultsViewUpdater configureCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

NS_ASSUME_NONNULL_END
