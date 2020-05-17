//
//  MMSSplitViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 26/11/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const UIViewControllerCurrentDetailModelIdentifierDidChangeNotification;

@interface MMSSplitViewController : UISplitViewController

//@property (strong, nonatomic, readonly) __kindof UIViewController *detailViewController;

@end

@interface UIViewController (MMSSplitViewController)

@property (strong, nonatomic, setter=mms_setDetailModelIdentifier:) NSString *mms_detailModelIdentifier;

@property (strong, nonatomic, readonly) MMSSplitViewController *mms_splitViewController;

@property (copy, nonatomic, readonly) NSString *mms_currentDetailModelIdentifier;





@end

NS_ASSUME_NONNULL_END
