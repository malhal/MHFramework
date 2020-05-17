//
//  UIViewController+MMSDetailItem.h
//  MMShared
//
//  Created by Malcolm Hall on 30/10/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MMSDetailItem)

- (BOOL)mms_containsDetailItem:(id)object;

//- (id)mms_currentVisibleDetailItemWithSender:(id)sender;

- (id)mms_containedDetailItem;

//- (BOOL)mms_canSelectDetailDetailItem:(id)object;

//- (id)mms_currentDetailDetailItemWithSender:(id)sender;

//- (id)mms_detailDetailItem;

//- (void)mms_showDetailDetailViewController:(UIViewController *)vc sender:(id)sender;

//- (UIBarButtonItem *)mms_currentDisplayModeButtonItemWithSender:(id)sender;

- (UIViewController *)mms_currentVisibleDetailViewControllerWithSender:(id)sender;

@end

@interface UISplitViewController (MMSDetailItem)

//- (id)mms_currentVisibleDetailItem;

@end

NS_ASSUME_NONNULL_END
