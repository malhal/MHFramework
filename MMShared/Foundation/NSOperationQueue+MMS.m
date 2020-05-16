//
//  NSOperationQueue+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 13/10/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSOperationQueue+MMS.h"

@implementation NSOperationQueue (MMS)

- (void)mms_addSerialOperation:(NSOperation *)op{
    // ensure the operation will not start until the previous has finished.
    NSOperation* lastOp = self.operations.lastObject;
    if (lastOp){
        [op addDependency: lastOp];
    }
    [self addOperation:op];
}

+ (NSOperationQueue *)mms_sharedOperationQueue{
    static NSOperationQueue* sharedOperationQueue = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedOperationQueue = [[NSOperationQueue alloc] init];
    });
    return sharedOperationQueue;
}

@end
