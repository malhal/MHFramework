//
//  MMSMasterTableViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 04/03/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MMShared/MMSFetchedTableViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSMasterTableViewController : MMSFetchedTableViewController <UINavigationControllerDelegate>

- (NSObject *)detailItemInDetailNavigationController:(UINavigationController *)navigation;

@property (strong, nonatomic) UINavigationController *detailNavigationController;

@end

@interface UIViewController (MMSMasterTableViewController)

- (UIViewController *)mms_currentDetailViewControllerWithSender:(id)sender;

@end

NS_ASSUME_NONNULL_END
