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


//@protocol MMSTableViewFetchedResultsControllerCellUpdating;

// TableViewFetchingAdapter, FetchedResultsViewUpdater
@interface MMSTableViewFetchedResultsController<ResultType:id<NSFetchRequestResult>> : NSFetchedResultsController <UITableViewDataSource>
//NSFetchedResultsControllerDelegate

- (instancetype)initWithFetchRequest:(NSFetchRequest<ResultType> *)fetchRequest managedObjectContext: (NSManagedObjectContext *)context sectionNameKeyPath:(nullable NSString *)sectionNameKeyPath cacheName:(nullable NSString *)name tableView:(UITableView *)tableView;

//@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

// maybe use this for implementing swipe to delete?
@property (assign, nonatomic) BOOL canDeleteObjects;

@property (strong, nonatomic, readonly) UITableView *tableView;

//- (instancetype)initWithTableView:(UITableView *)tableView;

//- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)controller;
//- (instancetype)initWithTableView:(UITableView *)tableView;

// defaults to NSObject : Cell
//@property (strong, nonatomic) NSDictionary *cellIdentifiersByClassName;

//@property (weak, nonatomic) id<MMSTableViewFetchedResultsControllerDelegate> delegate;
//@property (weak, nonatomic) id<MMSTableViewFetchedResultsControllerCellUpdating> cellUpdater;

// override to return a cell. Default implementation dequeues a @"Cell" identifier.
// configureWithObject will be called on the cell returned from this. B
//- (UITableViewCell<MMSTableViewCellConfiguring> *)cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

- (void)updateCell:(UITableViewCell *)cell withObject:(id)object;

@end
//
//@protocol MMSTableViewFetchedResultsControllerCellUpdating <NSObject>
//
//- (void)fetchedResultsViewUpdater:(MMSTableViewFetchedResultsController *)fetchedResultsViewUpdater updateCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

//@protocol MMSTableViewFetchedResultsControllerDelegate<NSObject>
//
//@required
//- (void)fetchedResultsViewUpdater:(MMSTableViewFetchedResultsController *)fetchedResultsViewUpdater configureCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

NS_ASSUME_NONNULL_END
