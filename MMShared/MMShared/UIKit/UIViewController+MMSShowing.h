//
//  UIViewController+MMSShowing.h
//  MMShared
//
//  Created by Malcolm Hall on 31/10/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MMSShowing)

// Returns whether calling showViewController:sender: would cause a navigation "push" to occur
- (BOOL)mms_willShowingViewControllerPushWithSender:(id)sender;

// Returns whether calling showDetailViewController:sender: would cause a navigation "push" to occur
- (BOOL)mms_willShowingDetailViewControllerPushWithSender:(id)sender;

- (BOOL)mms_willShowingDetailDetailViewControllerPushWithSender:(id)sender;

@end

NS_ASSUME_NONNULL_END
