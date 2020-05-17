//
//  UINavigationController+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 28/06/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>


//NS_ASSUME_NONNULL_BEGIN

MMS_EXTERN NSNotificationName const MMSNavigationControllerWillShowViewControllerNotification;
MMS_EXTERN NSNotificationName const MMSNavigationControllerDidShowViewControllerNotification;
MMS_EXTERN NSString * const MMSNavigationControllerNextVisibleViewController;
MMS_EXTERN NSString * const MMSNavigationControllerLastVisibleViewController;

//}
//NS_ASSUME_NONNULL_END

@interface UINavigationController (MMS)



@end
