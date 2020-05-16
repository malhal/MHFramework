//
//  MMSSplitViewController+Private.h
//  MMShared
//
//  Created by Malcolm Hall on 11/02/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import "MMSSplitViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMSSplitViewController (Private)

- (void)viewControllerUpdatedDetailModelIdentifier:(UIViewController *)vc;

@end

@interface UIViewController (MMSSplitViewController)

@property (weak, nonatomic, setter=mms_setDetailShowingViewController:) MMSSplitViewController *mms_detailShowingViewController;

//@property (copy, nonatomic, readwrite, setter=mms_setCurrentDetailModelIdentifier:) NSString *mms_currentDetailModelIdentifier;

@property (strong, nonatomic, readonly) UIViewController *mms_detailShownViewController;

- (void)mms_viewControllerUpdatedDetailModelIdentifier:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
