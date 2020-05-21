//
//  MMSFetchedResultsTableViewController.m
//  MMShared
//
//  Created by Malcolm Hall on 21/05/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import "MMSFetchedResultsTableViewController.h"
#import "MMSTableViewFetchedResultsAdapter.h"

static void * const kTimestampKVOContext = (void *)&kTimestampKVOContext;

@interface MMSFetchedResultsTableViewController()

@end


@implementation MMSFetchedResultsTableViewController

- (void)setTableViewFetchedResultsController:(MMSTableViewFetchedResultsAdapter *)tableViewFetchedResultsAdapter{
    if(_tableViewFetchedResultsAdapter == tableViewFetchedResultsAdapter){
        return;
    }
    _tableViewFetchedResultsAdapter = tableViewFetchedResultsAdapter;
    tableViewFetchedResultsAdapter.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
//    NSParameterAssert(self.tableViewFetchedResultsAdapter);
//    if(!self.fet.fetchedObjects){
//        NSError *error;
//        if(![self.tableViewFetchedResultsAdapter performFetch:&error]){
//            NSLog(@"Error fetching %@", error);
//        }
//    }
    [super viewWillAppear:animated];
}

- (nullable UITableViewCell *)tableViewFetchedResultsAdapter:(MMSTableViewFetchedResultsAdapter *)tableViewFetchedResultsAdapter cellForObject:(id)object atIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSManagedObject *object = [self.tableViewFetchedResultsAdapter objectAtIndexPath:indexPath];
//    [object addObserver:self forKeyPath:@"timestamp" options:0 context:kTimestampKVOContext];
//}
//
//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSManagedObject *object = [self.tableViewFetchedResultsAdapter objectAtIndexPath:indexPath];
//    @try {
//        [object removeObserver:self forKeyPath:@"timestamp" context:kTimestampKVOContext];
//    } @catch (NSException *exception) {
//        
//    } @finally {
//        
//    }
//}
//
//- (void)updateCell:(UITableViewCell *)cell withObject:(id)object forKeyPath:(NSString *)keypath{
//    
//}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if (context == kTimestampKVOContext) {
//        NSIndexPath *indexPath = [self.tableViewFetchedResultsAdapter indexPathForObject:object];
//        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//        if(cell){
//            cell.textLabel.text = [object description];
//        }
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
//}



@end
