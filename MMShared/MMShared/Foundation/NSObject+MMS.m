//
//  NSObject+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 30/10/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "NSObject+MMS.h"

#pragma clang diagnostic ignored "-Wincomplete-implementation" // for className
@implementation NSObject (MMS)

- (void)mms_addObserver:(NSObject *)observer forKeyPaths:(NSArray <NSString *> *)keyPaths options:(NSKeyValueObservingOptions)options context:(void *)context{
    [keyPaths enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addObserver:observer forKeyPath:obj options:options context:context];
    }];
}

- (void)mms_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

@end
