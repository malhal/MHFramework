//
//  MMSQueueOperation.m
//  MMShared
//
//  Created by Malcolm Hall on 03/08/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "MMSQueueOperation.h"
#import "MMSError.h"
#import "NSError+MMS.h"
#import "NSOperationQueue+MMS.h"

static void * const MMSQueueOperationContext = (void *)&MMSQueueOperationContext;

@interface MMSQueueOperation()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation MMSQueueOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        // we init here rather than shouldPerform so that it can be used before or after a subclasses call to super.
        // furthermore this object is definately required so no point in lazy loading.
        _operationQueue = [NSOperationQueue.alloc init];
        _operationQueue.suspended = YES;
    }
    return self;
}

// could be called from any thread.
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    // if it was our observation
    if(context == MMSQueueOperationContext){
        if([[change objectForKey:NSKeyValueChangeNewKey] isEqual:@0]){
            NSError *error;
            if(self.isCancelled){
                error = [NSError mms_errorWithDomain:MMSharedErrorDomain code:MMSErrorOperationCancelled descriptionFormat:@"The %@ was cancelled", self.class];
            }
            [self finishWithError:error];
        }
    }
    else{
        // if necessary, pass the method up the subclass hierarchy.
        if([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]){
            [super observeValueForKeyPath:keyPath
                                 ofObject:object
                                   change:change
                                  context:context];
        }
    }
}

- (void)performAsyncOperation{
    // Start the queue and for safety delay until after the operations have been added by the subclass.
    // This means it doesn't matter if they call super at start or end of their method.
    [self performBlockOnCallbackQueue:^{
        [self.operationQueue addObserver:self
                          forKeyPath:NSStringFromSelector(@selector(operationCount))
                             options:NSKeyValueObservingOptionNew
                             context:MMSQueueOperationContext];
        self.operationQueue.suspended = NO;
    }];
}

// also cancel any data task associated to this task.
- (void)cancel{
    [super cancel];
    [self.operationQueue cancelAllOperations];
}

- (void)finishWithError:(NSError *)error{
    if(error){
        // might already be cancelled if cancel was called but its ok to cancel again.
        [self.operationQueue cancelAllOperations];
    }
    [super finishWithError:error];
}

- (void)addOperation:(NSOperation *)operation{
    [self.operationQueue addOperation:operation];
}

- (void)finishOnCallbackQueueWithError:(NSError *)error
{
    [self.operationQueue removeObserver:self forKeyPath:NSStringFromSelector(@selector(operationCount))];
    [super finishOnCallbackQueueWithError:error];
}

@end

@implementation MMSSerialQueueOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        // this makes one operation run at a time but it does not ensure order.
        self.operationQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

- (void)addOperation:(NSOperation*)op{
    [self.operationQueue mms_addSerialOperation:op];
}

@end
