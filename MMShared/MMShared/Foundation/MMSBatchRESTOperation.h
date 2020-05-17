//
//  MMSBatchRESTOperation.h
//  MMShared
//
//  Created by Malcolm Hall on 23/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>
#import <MMShared/MMSRESTOperation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSBatchRESTOperation : MMSRESTOperation

// each request in the batch should have a mms_JSONBody that is an NSDictionary
// the url should be the path under http://host/api/ e.g. venue
- (instancetype)initWithURLRequest:(nullable NSMutableURLRequest *)request batchRequests:(nullable NSArray<NSMutableURLRequest *> *)batchRequests;

@property (nonatomic, copy, nullable) NSArray<NSMutableURLRequest *> *batchRequests;

/* Called on success or failure for each request in the batch. The callback is called in order of the batch requests. */
@property (nonatomic, copy, nullable) void (^perRequestCompletionBlock)(NSMutableURLRequest *request, id __nullable JSONObject, NSHTTPURLResponse * __nullable response, NSError * __nullable error);

// If the error is MMSErrorPartialFailure, the error's userInfo dictionary contains
// a dictionary of recordIDs to errors keyed off of MMSPartialErrorsByItemIDKey.
@property (nonatomic, copy, nullable) void (^batchCompletionBlock)(NSError * __nullable error);

@end

//@interface NSURLRequest (MMSBatchRESTOperation)
//
//@property (nullable, copy, setter=mms_setIdentifier:) id mms_identifier;
//
//@end

NS_ASSUME_NONNULL_END
