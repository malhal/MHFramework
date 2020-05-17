//
//  MMSError.h
//  MMShared
//
//  Created by Malcolm Hall on 09/07/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

MMS_EXTERN NSString * const MMSCDErrorDomain;

typedef NS_ENUM(NSInteger, MMSCDErrorCode) {
    MMSCDErrorUnknown                = 1,  /* Unknown or generic error */
    MMSCDErrorInvalidArguments       = 2,  /* Things needed were not set */
};

NS_ASSUME_NONNULL_END

