//
//  UITabBar+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 08/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//
// Progress bar that appears at top of tab bar.

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (MMS)

@property (nonatomic, strong, readonly) UIProgressView *mms_progressView;

@end

NS_ASSUME_NONNULL_END
