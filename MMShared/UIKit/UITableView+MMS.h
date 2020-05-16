//
//  UITableView+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/01/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewDelegate_MMS;

@interface UITableView (MMS)

@property (nonatomic, weak, nullable) id <UITableViewDelegate_MMS> delegate;

// returns all the indexPaths in the table.
- (NSArray *)mms_indexPaths;

// for selecting another index after current index is deleted. Either returns same if still availbale or count - 1 if not
// for when the last one was deleted.
- (NSIndexPath *)mms_indexPathNearDeletedIndexPath:(NSIndexPath *)indexPath;

// rows that are fully visible and not under any translucent bars.
- (NSArray *)mms_indexPathsForSafeAreaRows;

- (NSArray<UITableViewCell *> *)mms_selectedVisibleCells;

- (UITableViewCell *)mms_visibleCellAncestorOfView:(UIView *)view;

@end

@protocol UITableViewDelegate_MMS <UITableViewDelegate>

@optional
// this is more like didEndEditing because is only called when editing ends, and is called even if text wasn't changed.
- (void)tableView:(UITableView *)tableView didUpdateTextFieldForRowAtIndexPath:(NSIndexPath *)indexPath withValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
