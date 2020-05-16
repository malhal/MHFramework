//
//  UISplitViewController+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 08/12/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const MMSSplitViewControllerDidChangeSplitItem;

@interface UISplitViewController (MMS)

@property (strong, nonatomic, nullable, readonly) UIViewController *mms_secondaryViewController;

@property (strong, nonatomic, nullable, readonly) UINavigationController *mms_secondaryNavigationController;

//@property (strong, nonatomic, nullable, setter=mms_setDetailItem:) id mms_containedDetailItem;



@end

NS_ASSUME_NONNULL_END
