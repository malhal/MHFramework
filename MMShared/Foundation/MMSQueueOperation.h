//
//  MMSQueueOperation.h
//  MMShared
//
//  Created by Malcolm Hall on 03/08/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>
#import <MMShared/MMSAsyncOperation.h>

@interface MMSQueueOperation : MMSAsyncOperation

- (void)addOperation:(NSOperation *)operation;

// add your methods to the queue then call super to asynchronously unsuspend the queue, thus it does not matter if super is invoked first or last.
- (void)performAsyncOperation NS_REQUIRES_SUPER;

@end

/**
 The serial queue sets the number of simultaneous operations to 1 and
 it adds a dependency on the last operation before adding to the queue.
 */
@interface MMSSerialQueueOperation : MMSQueueOperation

@end
