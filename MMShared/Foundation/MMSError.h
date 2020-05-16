//
//  MMSharedErrors.h
//  MMShared
//
//  Created by Malcolm Hall on 12/06/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

MMS_EXTERN NSString * const MMSharedErrorDomain;
MMS_EXTERN NSString * const MMSPartialErrorsByItemIDKey;

typedef NS_ENUM(NSInteger, MMSErrorCode) {
    MMSErrorUnknown                = 1,  /* Unknown or generic error */
    MMSErrorOperationCancelled     = 2,  /* A MMS operation was explicitly cancelled */
    MMSErrorInvalidArguments       = 3,  /* Things needed were not set */
    MMSErrorPartialFailure         = 4   /* Some items failed, but the operation succeeded overall */
};

NS_ASSUME_NONNULL_END
