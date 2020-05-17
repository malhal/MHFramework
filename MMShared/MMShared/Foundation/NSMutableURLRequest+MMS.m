//
//  NSMutableURLRequest+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 02/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSMutableURLRequest+MMS.h"
#import "MMSHTTP.h"

@implementation NSMutableURLRequest (MMS)

- (BOOL)mms_setJSONObject:(id)JSONObject error:(NSError**)error{
    NSData* data = [NSJSONSerialization dataWithJSONObject:JSONObject options:0 error:error];
    if(!data){
        return NO;
    }
    self.HTTPBody = data;
    [self mms_setContentTypeJSON];
    if([self.HTTPMethod isEqualToString:@"GET"]){
        [self mms_setPOST];
    }
    return YES;
}

- (void)mms_setAcceptJSON{
    [self setValue:@"application/json" forHTTPHeaderField:@"Accept"];
}

- (void)mms_setContentTypeJSON{
    [self setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}

// untested
- (void)mms_setContentTypePropertyList{
    [self setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
}

- (void)mms_setPOST{
    [self setHTTPMethod:MMSHTTPMethodPOST];
}

- (void)mms_setPUT{
    [self setHTTPMethod:MMSHTTPMethodPUT];
}

- (void)mms_contentEncodingGZIP{
    [self setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
}

- (void)mms_setBasicAuthUsername:(NSString*)username password:(NSString*)password{
    NSString *authStr = [NSString stringWithFormat:@"%@:%@",username,password];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat: @"Basic %@",[authData base64EncodedStringWithOptions:0]];
    [self setValue:authValue forHTTPHeaderField:@"Authorization"];
}

- (void)mms_setAcceptGzip{
    [self addValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
}

// untested
- (BOOL)mms_setPropertyList:(id)propertyList error:(NSError**)error{
    NSString* errorString = nil;
    NSData* data = [NSPropertyListSerialization dataFromPropertyList:propertyList format:NSPropertyListXMLFormat_v1_0 errorDescription:&errorString];
    if(!data){
        if(error){
            *error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadCorruptFileError userInfo:[NSDictionary dictionaryWithObject:errorString forKey:NSLocalizedDescriptionKey]];
        }
        return NO;
    }
    self.HTTPBody = data;
    [self mms_setContentTypePropertyList];
    if([self.HTTPMethod isEqualToString:@"GET"]){
        [self mms_setPOST];
    }
    return YES;
    
    
}

@end
