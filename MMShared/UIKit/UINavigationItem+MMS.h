//
//  UINavigationItem+MMS
//  MMShared
//
//  Created by Malcolm Hall on 10/04/2015.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (MMS)

- (UIView *)mms_getTitleRefreshView;
- (void)mms_setTitleRefreshView:(UIView *)titleRefreshView;
- (void)mms_beginTitleRefreshing;
- (void)mms_endTitleRefreshing;

// by default calls to begin end are counted, use this method to override and hide the activity view by setting resetCounter YES.
- (void)mms_endTitleRefreshingResetCounter:(BOOL)resetCounter;

@end

NS_ASSUME_NONNULL_END
