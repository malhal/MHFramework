//
//  NSMutableDictionary+Nulls.m
//  DataStoreDemo
//
//  Created by Malcolm Hall on 10/11/2014.
//  Copyright (c) 2014 Malcolm Hall. All rights reserved.
//

#import "NSMutableDictionary+MMS.h"

@implementation NSMutableDictionary (MMS)

//Returns NO if `anObject` is nil; can be used by the sender of the message or ignored if it is irrelevant.
- (BOOL)mms_setObjectOrNull:(id)anObject forKey:(id)aKey
{
    if(anObject!=nil) {
        [self setObject:anObject forKey:aKey];
        return YES;
    }
    else {
        [self setObject:[NSNull null] forKey:aKey];
        return NO;
    }
}

@end
