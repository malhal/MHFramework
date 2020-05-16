//
//  UINavigationBar+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 05/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (MMS)

@property (nonatomic, readonly) UIProgressView* mms_progressView;

@end

NS_ASSUME_NONNULL_END
