//
//  NSException+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 18/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "NSException+MMS.h"

// todo: get this name into the string with a macro.
//NSString * const MMSNotImplementedException = @"";

@implementation NSException (MMS)

+ (NSException *)mms_notImplementedException{
    return [NSException exceptionWithName:@"NotImplementedException" reason:[[NSThread callStackSymbols] description] userInfo:nil];
}

+ (NSException *)mms_abstractException{
    return [NSException exceptionWithName:@"AbstractException" reason:[[NSThread callStackSymbols] description] userInfo:nil];
}

+ (NSException *)mms_designatedInitializerException{
    NSString *reason = [NSString stringWithFormat:@"Failed to call designated initializer on '%@' \n", NSStringFromClass([self class])];
    return [NSException exceptionWithName:NSGenericException reason:reason userInfo:nil];
}

+ (void)mms_crashThisApp{
    [NSException raise:NSGenericException format:@"You crashed the app on purpose."];
}

@end
