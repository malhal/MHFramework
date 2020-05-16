//
//  NSURLRequest+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 02/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

@interface NSMutableURLRequest (MMS)

// Sets the content type to application/json, json encodes the object, returning an error if fails, and sets it on the HTTPBody
// Also sets method to POST.
- (BOOL)mms_setJSONObject:(id)JSONObject error:(NSError **)error;

- (void)mms_setPOST;

- (void)mms_setPUT;

// you must gzip the body too.
- (void)mms_contentEncodingGZIP;

- (void)mms_setAcceptJSON;

- (void)mms_setContentTypeJSON;

- (void)mms_setBasicAuthUsername:(NSString *)username password:(NSString *)password;

- (void)mms_setAcceptGzip;

- (BOOL)mms_setPropertyList:(id)propertyList error:(NSError**)error;

- (void)mms_setContentTypePropertyList;

@end
