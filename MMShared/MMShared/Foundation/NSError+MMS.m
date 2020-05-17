//
//  NSError+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 30/07/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSError+MMS.h"

@implementation NSError (MMS)

+ (instancetype)mms_errorWithDomain:(NSString *)domain code:(NSInteger)code description:(NSString*)description{
    return [self errorWithDomain:domain code:code userInfo:@{NSLocalizedDescriptionKey : description}];
}

+ (instancetype)mms_errorWithDomain:(NSString *)domain code:(NSInteger)code descriptionFormat:(NSString*)descriptionFormat arguments:(va_list)arguments{
    NSString *description = [NSString.alloc initWithFormat:descriptionFormat arguments:arguments];
    return [self mms_errorWithDomain:domain code:code description:description];
}

+ (instancetype)mms_errorWithDomain:(NSString *)domain code:(NSInteger)code descriptionFormat:(NSString*)descriptionFormat, ...{
    va_list arguments;
    va_start(arguments, descriptionFormat);
    id result = [self mms_errorWithDomain:domain code:code descriptionFormat:descriptionFormat arguments:arguments];
    va_end(arguments);
    return result;
}



@end
