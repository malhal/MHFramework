//
//  NSException+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 18/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

//MMS_EXTERN NSString * const MMSNotImplementedException;

@interface NSException (MMS)

+ (NSException *)mms_notImplementedException;
+ (NSException *)mms_abstractException;
+ (NSException *)mms_designatedInitializerException;
+ (void)mms_crashThisApp;

@end

NS_ASSUME_NONNULL_END
