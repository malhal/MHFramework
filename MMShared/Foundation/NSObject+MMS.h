//
//  NSObject+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 30/10/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MMS)

- (void)mms_addObserver:(NSObject *)observer forKeyPaths:(NSArray<NSString *> *)keyPaths options:(NSKeyValueObservingOptions)options context:(void *)context;
- (NSString *)className;
- (void)mms_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end

NS_ASSUME_NONNULL_END
