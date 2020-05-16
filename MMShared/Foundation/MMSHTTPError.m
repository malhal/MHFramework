//
//  MMSHTTPError.m
//  MMShared
//
//  Created by Malcolm Hall on 10/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "MMSHTTPError.h"
#import "NSDictionary+MMS.h"

NSString * const MMSHTTPErrorDomain = @"MMSHTTPErrorDomain";

@implementation MMSHTTPError

- (instancetype)initWithStatusCode:(NSInteger)statusCode userInfo:(NSDictionary*)userInfo{
    // add a default description based on code if none exists.
    if(!userInfo[NSLocalizedDescriptionKey]){
        NSDictionary* descriptionDict = @{NSLocalizedDescriptionKey : [NSHTTPURLResponse localizedStringForStatusCode:statusCode]};
        if(userInfo){
            userInfo = [userInfo mms_dictionaryByAddingEntriesFromDictionary:descriptionDict];
        }else{
            userInfo = descriptionDict;
        }
    }
    return [super initWithDomain:MMSHTTPErrorDomain code:statusCode userInfo:userInfo];
}

+ (instancetype)HTTPErrorWithStatusCode:(NSInteger)statusCode userInfo:(NSDictionary*)userInfo{
    return [MMSHTTPError.alloc initWithStatusCode:statusCode userInfo:userInfo];
}

@end
