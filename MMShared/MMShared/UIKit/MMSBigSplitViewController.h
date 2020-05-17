//
//  MMSSplitViewController.h
//  BigSplit
//
//  Created by Malcolm Hall on 21/08/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSBigSplitViewController : UISplitViewController

//@property (strong, nonatomic) UIBarButtonItem *threeColumnsButtonItem;

//@property (strong, nonatomic, readonly) MMSMasterItemSplitter *masterItemSplitter;

//@property (strong, nonatomic, readonly) MMSSplitViewController *childSplitController;

@end

@interface UIViewController (MMSBigSplitViewController)

@property (strong, nonatomic, readonly) MMSBigSplitViewController *mms_bigSplitViewController;

@end

NS_ASSUME_NONNULL_END
