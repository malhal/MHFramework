//
//  MasterViewController.h
//  StoryboardObjectsTest
//
//  Created by Malcolm Hall on 03/06/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class NSFetchedResultsController;
//@protocol MMSUpdatingTableViewControllerFetchedResultsSupportDelegate;

// or CellUpdatingTableViewController
@protocol MMSTableViewControllerCellUpdating <NSObject>

- (UITableView *)tableView;
- (void)updateCell:(UITableViewCell *)cell withObject:(id)object;

@end


@interface MMSUpdatingTableViewControllerFetchedResultsSupport : NSObject<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (weak, nonatomic) IBOutlet UIViewController<MMSTableViewControllerCellUpdating> *viewController;

- (instancetype)initWithViewController:(UIViewController<MMSTableViewControllerCellUpdating> *)viewController;

//@property (weak, nonatomic) IBOutlet id<MMSUpdatingTableViewControllerFetchedResultsSupportDelegate> delegate;

@end

//@protocol MMSUpdatingTableViewControllerFetchedResultsSupportDelegate <NSObject>
//
//- (void)fetchSupport:(MMSUpdatingTableViewControllerFetchedResultsSupport *)fetchSupport updateCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

NS_ASSUME_NONNULL_END
