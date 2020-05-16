//
//  MMSUtilities.m
//  MMShared
//
//  Created by Malcolm Hall on 19/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "MMSUtilities.h"
#import "MMSReachability.h"
#import "NSException+MMS.h"
#import <objc/runtime.h>

id MMSDynamicCast(Class aClass, id object){
    if([object isKindOfClass:aClass]){
        return object;
    }
    return nil;
}

id MMSCheckedDynamicCast(Class aClass, id object){
    if([object isKindOfClass:aClass]){
        return object;
    }
    else if(object){
        NSLog(@"Unexpected object type in checked dynamic cast %@ expects %@", [object class], aClass);
    }
    return nil;
}

id MMSProtocolCast(Protocol *protocol, id object){
    if(protocol && [object conformsToProtocol:protocol]){
        return object;
    }
    return nil;
}


float MMSDispatchMainAfterDelay(dispatch_block_t block){
    float f = dispatch_time(DISPATCH_TIME_NOW, 0);
    dispatch_after(f, dispatch_get_main_queue(), block);
    return f;
}

void MMSPerformBlockOnMainThread(dispatch_block_t block){
    if ([NSThread isMainThread]){
        block();
    }else{
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

BOOL MMSProtocolHasInstanceMethod(Protocol * protocol, SEL selector) {
    struct objc_method_description desc;
    desc = protocol_getMethodDescription(protocol, selector, NO, YES);
    if(desc.name){
        return YES;
    }
    desc = protocol_getMethodDescription(protocol, selector, YES, YES);
    if(desc.name){
        return YES;
    }
    return NO;
}


@implementation MMSUtilities

+ (struct _NSRange)range:(struct _NSRange)arg1 liesWithinRange:(struct _NSRange)arg2 assert:(BOOL)arg3{
    @throw [NSException mms_notImplementedException];
}


@end
