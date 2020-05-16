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

@class MMSFetchedTableDataSource;

//@protocol MMSFetchedTableDataSourceDelegate<NSObject>
//
//- (void)fetchedTableDataSource:(MMSFetchedTableDataSource *)fetchedTableDataSource configureCell:(UITableViewCell *)cell withObject:(id)object;
//
//@end

@interface MMSFetchedTableDataSource : NSObject<UITableViewDataSource>

@property (strong, nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)controller;

// defaults to NSObject : Cell
//@property (strong, nonatomic) NSDictionary *cellIdentifiersByClassName;

//@property (weak, nonatomic) id<MMSFetchedTableDataSourceDelegate> delegate;

- (UITableViewCell *)cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath inTableView:(UITableView *)tableView;

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object inTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
