//
//  UIDevice+MMS.h
//  WiFiFoFum Nearby
//
//  Created by marek on 24/07/2013.
//  Copyright (c) 2013 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (MMS)

// should this even be cached?
- (NSString *)mms_cachedIdentifierForVendor;

@end

NS_ASSUME_NONNULL_END
