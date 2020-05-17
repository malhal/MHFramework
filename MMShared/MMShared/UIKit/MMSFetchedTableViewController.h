//
//  MMSFetchedTableViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 05/12/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

//extern NSString * const MMSFetchedTableViewControllerSelectedObjectDidUpdateNotification;

@protocol MMSFetchedTableViewControllerDelegate;
@class MMSFetchedTableDataSource;

// only put table stuff in here
@interface MMSFetchedTableViewController<ResultType:NSManagedObject *> : UITableViewController <NSFetchedResultsControllerDelegate> // UIDataSourceModelAssociation

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//@property (strong, nonatomic, nullable) NSFetchedResultsController<ResultType> *fetchedResultsController;

//@property (strong, nonatomic, readonly) NSArray<ResultType> *fetchedObjects;

@property (strong, nonatomic, nullable) MMSFetchedTableDataSource *fetchedTableDataSource;

// the default implementation sets the accessory depending on push.
- (void)configureCell:(UITableViewCell *)cell withObject:(ResultType)object;

- (void)selectObject:(NSManagedObject *)object;
- (void)deselectObject:(NSManagedObject *)object;

@property (strong, nonatomic) ResultType selectedObject;

- (void)configureView;

- (void)fetchAndReload;

// calls tableViewDidEndEditing after the animations end, so table rows can be reselected.
//- (void)setEditing:(BOOL)editing animated:(BOOL)animated NS_REQUIRES_SUPER;

// disables the edit button
//- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath NS_REQUIRES_SUPER;

// enables the edit button and delay invokes tableViewDidEndEditing
//- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath NS_REQUIRES_SUPER;

@property (assign, nonatomic) id<MMSFetchedTableViewControllerDelegate> delegate;

// removed this because its ok for it to be nil.
//- (void)createFetchedResultsController;

- (ResultType)objectAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol MMSFetchedTableViewControllerDelegate<UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>
@optional
- (void)fetchedTableViewController:(MMSFetchedTableViewController *)fetchedTableViewController configureCell:(UITableViewCell *)cell withObject:(NSManagedObject *)object;

@end

//@interface UITableViewController (MMSFetchedTableViewController)
//
//@property (strong, nonatomic) MMSFetchedTableViewController *mms_fetchedTableViewController;
//
//@end

NS_ASSUME_NONNULL_END
