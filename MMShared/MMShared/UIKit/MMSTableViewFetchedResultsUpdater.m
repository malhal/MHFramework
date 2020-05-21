//
//  MMSTableViewFetchedResultsUpdater.m
//  MMShared
//
//  Created by Malcolm Hall on 21/05/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import "MMSTableViewFetchedResultsUpdater.h"
#import "MMSTableViewFetchedResultsController.h"

@interface MMSTableViewFetchedResultsUpdater()

@property (assign, nonatomic) BOOL sectionsCountChanged;

@end


@implementation MMSTableViewFetchedResultsUpdater

- (instancetype)initWithTableViewFetchedResultsController:(MMSTableViewFetchedResultsController *)tableViewFetchedResultsController{
    self = [super init];
    if (self) {
        _tableViewFetchedResultsController = tableViewFetchedResultsController;
        tableViewFetchedResultsController.delegate = self;
    }
    return self;
}

- (UITableView *)tableView{
    return self.tableViewFetchedResultsController.tableView;
}

#pragma mark - Fetched results controller

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    //self.didBeginUpdatingFromFetchedResultsController = YES;
    //self.wasDisplayed = self.mms_isViewVisible;
    self.sectionsCountChanged = NO;
//    [self.tableViewIfVisible beginUpdates];
 //   self.tableUpdates = [NSBlockOperation.alloc init];
//    if([self.fetchedResultsDelegate respondsToSelector:@selector(controllerWillChangeContent:)]){
//        [self.fetchedResultsDelegate controllerWillChangeContent:controller];
//    }
    UITableView *tableView = self.tableView;
    [tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    UITableView *tableView = self.tableView;
    switch(type) {
        case NSFetchedResultsChangeInsert:
            self.sectionsCountChanged = YES;
            [tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;

        case NSFetchedResultsChangeDelete:
            [tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            self.sectionsCountChanged = YES;
            break;
        default:
            break;
    }

}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(NSManagedObject *)object
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {


    UITableView *tableView = self.tableView;

    //NSLog(@"%d %@ %@", type, indexPath, newIndexPath);

    //if(type != NSFetchedResultsChangeUpdate){
//    if(!self.wasDisplayed){
//        self.needsTableViewUpdates = YES;
//        return;
//    }
//    else
//    {
//        if(!self.tableViewBeginUpdatesWasCalled){
//            [tableView beginUpdates];
//            self.tableViewBeginUpdatesWasCalled = YES;
//        }
    //}
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        break;
        case NSFetchedResultsChangeMove:
            // Can't use the tableView move method becasue its animation does not play with section inserts/deletes.
            // Also if we used move would need to update the cell manually which might use the wrong index.
            // Even if old and new indices are the same we still need to call the methods.
        //    NSLog(@"%@", object.changedValuesForCurrentEvent.allKeys);
            if(self.sectionsCountChanged || indexPath.section != newIndexPath.section){
               // NSLog(@"delete, insert");
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                break;
            }
            [tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            // fall through
        case NSFetchedResultsChangeUpdate:
        {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            if(cell){
                // this can't call anything that will call [controller objectAtIndex] because it won't be the correct index.
                //[self.fetchedResultsViewUpdater configureCell:cell withObject:object];
                //[self configureCell:cell withObject:object];
//                if([tableView.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]){
//                    [tableView.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
//                }
                [self.tableViewFetchedResultsController updateCell:cell withObject:object];
            }
            break;
        }
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
   // [self configureView];
//    if(self.tableViewBeginUpdatesWasCalled){
//        [self.tableView endUpdates];
//        self.tableViewBeginUpdatesWasCalled = NO;
//    }


//    if(self.needsTableViewUpdates){
//        self.reloadTableOnNextAppear = YES;
//        self.needsTableViewUpdates = NO; // think this is to do with the item changing while
//    }
//
  //  self.didBeginUpdatingFromFetchedResultsController = NO;


    // we still do selecting when not displayed.
    //if(!self.wasDisplayed){// || self.isMovingOrDeleting)
    //    return;
    //}

//    [self.tableView performBatchUpdates:^{
//        [self.tableUpdates start];
//    } completion:^(BOOL finished) {
//        NSLog(@"Finished");
//        self.tableUpdates = nil;



 //   if(self.deletedIndexPath){
//        id object = [controller mcd_objectNearIndexPath:self.deletedIndexPath];
//        if(![self shouldShowDetailForObject:object]){
//            object = nil;
//        }
//        [self selectObject:object notifyWithSender:self selectRow:YES];
//        self.selectedObject = nil;
//        self.deletedIndexPath = nil;
//    }


  //  }];


    //    if(self.removedObjects.count){
    //        if([self.dataSource respondsToSelector:@selector(fetchedTable:didRemoveCellsForObjects:atIndexPaths:)]){
    //            [self.dataSource fetchedTable:self didRemoveCellsForObjects:self.removedObjects atIndexPaths:self.removedIndexPaths];
    //        }
    //        self.removedIndexPaths = nil;
    //        self.removedObjects = nil;
    //    }

    //    NSArray *fetchedObjectsBeforeChange = self.fetchedObjectsBeforeChange;
    //    self.fetchedObjectsBeforeChange = nil;
    //
    //    if(!self.selectedObjectWasDeleted){
    //        return;
    //    }
    //    self.selectedObjectWasDeleted = NO;
    //
    //    if(!self.tableViewController.shouldAlwaysHaveSelectedObject){
    //        return;
    //    }
    // its different context
    //    NSManagedObject *detailItem = self.tableViewController.selectedObject;
    //    //if(detailItem && ![controller.fetchedObjects containsObject:detailItem]){
    //    NSManagedObject *object;
    //    NSArray *fetchedObjects = controller.fetchedObjects;
    //    if(fetchedObjects.count > 0){
    //        NSUInteger i = [fetchedObjectsBeforeChange indexOfObject:detailItem];
    //        if(i >= fetchedObjects.count){
    //            i = fetchedObjects.count - 1;
    //        }
    //        object = fetchedObjects[i];
    //    }
    //    [self.tableViewController selectObject:object notifyDelegate:YES];


    //[self.tableViewController reselectTableRowIfNecessaryScrollToSelection:YES];
    //  }

}

@end
