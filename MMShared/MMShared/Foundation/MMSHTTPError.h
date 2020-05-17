//
//  MMSHTTPError.h
//  MMShared
//
//  Created by Malcolm Hall on 10/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

MMS_EXTERN NSString * const MMSHTTPErrorDomain;

@interface MMSHTTPError : NSError

// adds a description to the userInfo using the statusCode.
- (instancetype)initWithStatusCode:(NSInteger)statusCode userInfo:(NSDictionary*)userInfo;
+ (instancetype)HTTPErrorWithStatusCode:(NSInteger)statusCode userInfo:(NSDictionary*)userInfo;

@end

NS_ASSUME_NONNULL_END
