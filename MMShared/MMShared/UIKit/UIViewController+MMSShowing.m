//
//  UIViewController+MMSShowing.m
//  MMShared
//
//  Created by Malcolm Hall on 31/10/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import "UIViewController+MMSShowing.h"

@implementation UIViewController (MMSShowing)

- (BOOL)mms_willShowingViewControllerPushWithSender:(id)sender
{
    // Find and ask the right view controller about showing
    UIViewController *target = [self targetViewControllerForAction:@selector(mms_willShowingViewControllerPushWithSender:) sender:sender];
    if (target) {
        return [target mms_willShowingViewControllerPushWithSender:sender];
    } else {
        // Or if we can't find one, we won't be pushing
        return NO;
    }
}

- (BOOL)mms_willShowingDetailViewControllerPushWithSender:(id)sender
{
    // Find and ask the right view controller about showing detail
    UIViewController *target = [self targetViewControllerForAction:@selector(mms_willShowingDetailViewControllerPushWithSender:) sender:sender];
    if (target) {
        return [target mms_willShowingDetailViewControllerPushWithSender:sender];
    } else {
        // Or if we can't find one, we won't be pushing
        return NO;
    }
}

- (BOOL)mms_willShowingDetailDetailViewControllerPushWithSender:(id)sender
{
    // Find and ask the right view controller about showing detail
    UIViewController *target = [self targetViewControllerForAction:@selector(mms_willShowingDetailDetailViewControllerPushWithSender:) sender:sender];
    if (target) {
        return [target mms_willShowingDetailDetailViewControllerPushWithSender:sender];
    } else {
        // Or if we can't find one, we won't be pushing
        return NO;
    }
}

@end

@implementation UINavigationController (MMSShowing)

- (BOOL)mms_willShowingViewControllerPushWithSender:(id)sender
{
    // Navigation Controllers always push for showViewController:
    return YES;
}

@end

@implementation UISplitViewController (MMSShowing)

- (BOOL)mms_willShowingViewControllerPushWithSender:(id)sender
{
    // Split View Controllers never push for showViewController:
    return NO;
}

- (BOOL)mms_willShowingDetailViewControllerPushWithSender:(id)sender
{
    if (self.collapsed) {
        // If we're collapsed, re-ask this question as showViewController: to our primary view controller
        UIViewController *target = self.viewControllers.firstObject;
        return [target mms_willShowingViewControllerPushWithSender:sender];
    } else {
        // Otherwise, we don't push for showDetailViewController:
        return NO;
    }
}

@end
