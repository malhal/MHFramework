//
//  UITableView+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 19/01/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import "UITableView+MMS.h"

@implementation UITableView (MMS)

- (NSArray *)mms_indexPaths{
    NSMutableArray *indexPaths = NSMutableArray.array;
    for(NSUInteger section=0; section < self.numberOfSections; section++){
        for(NSUInteger row=0; row < [self numberOfRowsInSection:section]; row++){
            [indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:section]];
        }
    }
    return indexPaths;
}

- (NSIndexPath *)mms_indexPathNearDeletedIndexPath:(NSIndexPath *)indexPath{
    // NSAssert(!self.tableView.isEditing, @"Cannot select while editing");
    NSArray *indexPaths = self.mms_indexPaths;
    NSUInteger count = indexPaths.count;// [self numberOfRowsInSection:indexPath.section] ;//self.fetchedResultsController.fetchedObjects.count;
    //id item;
    if([indexPaths containsObject:indexPath]){
        return indexPath;
    }
    return indexPaths.lastObject;
//    NSIndexPath *newIndexPath;
//    if(count){
//        NSUInteger row = count - 1;
//        if(indexPath.row < row){
//            row = indexPath.row;
//        }
//        newIndexPath = [NSIndexPath indexPathForRow:row inSection:indexPath.section];
//    }
//    return newIndexPath;
}

- (NSArray<NSIndexPath *> *)mms_indexPathsForSafeAreaRows{
    return [self indexPathsForRowsInRect:self.safeAreaLayoutGuide.layoutFrame];
}

- (NSArray<UITableViewCell *> *)mms_selectedVisibleCells{
    return [self.visibleCells filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"selected = YES"]];
}

- (UITableViewCell *)mms_visibleCellAncestorOfView:(UIView *)view{
    for(UITableViewCell *visibleCell in self.visibleCells){
        if([view isDescendantOfView:visibleCell]){
            return visibleCell;
        }
    }
    return nil;
}

@end
