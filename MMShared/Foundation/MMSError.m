//
//  MMSharedErrors.m
//  MMShared
//
//  Created by Malcolm Hall on 12/06/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "MMSError_Internal.h"
#import "NSDictionary+MMS.h"

NSString * const MMSharedErrorDomain = @"MMSharedErrorDomain";
NSString * const MMSPartialErrorsByItemIDKey = @"MMSPartialErrorsByItemIDKey";

@implementation MMSError

+ (instancetype)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo{
    // add the description using a workaround for NSError's description method not calling localizedDescription.
    if(!userInfo[NSLocalizedDescriptionKey]){
        NSString* description;
        switch (code) {
            case MMSErrorUnknown:
                description = @"unknown error";
                break;
            case MMSErrorOperationCancelled:
                description = @"operation cancelled";
                break;
            case MMSErrorInvalidArguments:
                description = @"invalid arguments";
                break;
            case MMSErrorPartialFailure:
                description = @"partial failure";
                break;
        }
        if(description){
            NSDictionary* descriptionDictionary = @{NSLocalizedDescriptionKey : description};
            if(userInfo){
                userInfo = [userInfo mms_dictionaryByAddingEntriesFromDictionary:descriptionDictionary];
            }else{
                userInfo = descriptionDictionary;
            }
        }
    }
    return [self errorWithDomain:MMSharedErrorDomain code:code userInfo:userInfo];
}

@end
