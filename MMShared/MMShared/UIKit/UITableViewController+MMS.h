//
//  UITableViewController+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 11/02/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewController (MMS)

- (UITableView *)mms_tableViewIfLoaded;

@end

NS_ASSUME_NONNULL_END
