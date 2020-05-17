//
//  NSURLSessionDataTask+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 03/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSessionDataTask (MMS)

+ (NSURLSessionDataTask *)mms_stringTaskWithSession:(NSURLSession *)session request:(NSURLRequest *)request completionHandler:(void (^)(NSString * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler;

// parses the JSON and does not allow fragments, i.e. must be an array or dictionary.
+ (NSURLSessionDataTask *)mms_JSONTaskWithSession:(NSURLSession *)session request:(NSURLRequest *)request completionHandler:(void (^)(id __nullable JSONObject, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler;

+ (NSURLSessionDataTask *)mms_PropertyListTaskWithSession:(NSURLSession *)session request:(NSURLRequest *)request completionHandler:(void (^)(id __nullable propertyList, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler;

@end


NS_ASSUME_NONNULL_END
