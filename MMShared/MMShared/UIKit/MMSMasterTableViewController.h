//
//  MMSMasterTableViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 04/03/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//
// this class needs to be deleted

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSMasterTableViewController : UITableViewController <UINavigationControllerDelegate>

- (NSObject *)detailItemInDetailNavigationController:(UINavigationController *)navigation;

@property (strong, nonatomic) UINavigationController *detailNavigationController;

@end

@interface UIViewController (MMSMasterTableViewController)

- (UIViewController *)mms_currentDetailViewControllerWithSender:(id)sender;

@end

NS_ASSUME_NONNULL_END
