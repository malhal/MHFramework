//
//  MMSDetailViewManager.h
//  RootMMSMasterDetail
//
//  Created by Malcolm Hall on 10/12/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const MMSDetailViewManagerWillShowDetailViewControllerNotification;

@protocol MMSDetailViewManagerDelegate;

@interface MMSDetailViewManager : NSObject<UISplitViewControllerDelegate, UIStateRestoring>

// Doesn't take a master param because in case if 2-split with initial pushing master it doesn't exist yet.
- (instancetype)initWithSplitViewController:(UISplitViewController *)splitViewController;

@property (strong, nonatomic, readonly) UISplitViewController *splitViewController;

@property (weak, nonatomic, nullable) id<MMSDetailViewManagerDelegate> delegate;

@property (strong, nonatomic, readonly) UIViewController *detailViewController;

@end

@interface UISplitViewController (MMSDetailViewManager)

//@property (strong, nonatomic, readonly) MMSSplitDetailItem *mms_currentSplitDetailItem;

@property (weak, nonatomic, readonly) MMSDetailViewManager *mms_detailViewManager;

@end

@interface UIViewController (MMSDetailViewManager)

//- (id)mms_currentVisibleDetailItem;

@end

@protocol MMSDetailViewManagerDelegate<UISplitViewControllerDelegate>



@end

NS_ASSUME_NONNULL_END
