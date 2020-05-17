//
//  MMSBatchRESTOperation.m
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 23/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "MMSBatchRESTOperation.h"
#import "MMSRESTOperationSubclass.h"
#import "MMSError_Internal.h"
#import "NSError+MMS.h"
#import "MMSHTTPError.h"
#import "NSHTTPURLResponse+MMS.h"
#import <objc/runtime.h>

@interface MMSBatchRESTOperation()

//@property (nonatomic, strong) NSArray<NSDictionary *> *responseJSONDictionaries;

@property (nonatomic, strong) NSDictionary<NSURLRequest *, NSError *> *partialErrors;

@end

@implementation MMSBatchRESTOperation

- (instancetype)initWithURLRequest:(nullable NSMutableURLRequest *)request batchRequests:(nullable NSArray<NSMutableURLRequest *> *)batchRequests{
    
    self = [self initWithURLRequest:request];
    if (self) {
        _batchRequests = batchRequests.copy;
    }
    return self;
}

- (BOOL)asyncOperationShouldRun:(NSError **)error{
    if(!self.batchRequests.count) {
        *error = [NSError mms_errorWithDomain:MMSharedErrorDomain code:MMSErrorInvalidArguments descriptionFormat:@"batchRequests must be provided for %@", self.class];
        return NO;
    }
    
    
    NSMutableArray* requests = NSMutableArray.array;
    for(NSMutableURLRequest* batchRequest in self.batchRequests){
        [requests addObject:@{@"path" : batchRequest.URL.absoluteString,
                              @"method" : batchRequest.HTTPMethod,
                              @"body" : batchRequest.mms_JSONBody}];
    }
    
    self.request.mms_JSONBody = requests;
    
    return [super asyncOperationShouldRun:error];
}

- (void)performAsyncOperation{
    [super performAsyncOperation];
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSArray* responses = (NSArray *)self.JSONObject;
        if(![responses isKindOfClass:NSArray.class]){
            return [self finishWithError:[NSError mms_errorWithDomain:MMSharedErrorDomain code:MMSErrorUnknown descriptionFormat:@"An array of responses was not received for %@", self.class]];
        }
        NSMutableDictionary* partialErrors = [NSMutableDictionary dictionary];
        [responses enumerateObjectsUsingBlock:^(NSDictionary *rd, NSUInteger idx, BOOL *stop)
        {
             NSMutableURLRequest *request = self.batchRequests[idx];
             NSNumber *status = rd[@"status"];
             id JSONObject = rd[@"body"];
             NSHTTPURLResponse *HTTPURLResponse = [[NSHTTPURLResponse alloc] initWithURL:request.URL statusCode:status.integerValue HTTPVersion:nil headerFields:nil];
             NSError *error;
             if(!([JSONObject isKindOfClass:[NSDictionary class]] || [JSONObject isKindOfClass:[NSArray class]])){
                error = [NSError mms_errorWithDomain:MMSharedErrorDomain code:MMSErrorUnknown descriptionFormat:@"The response body JSON was not a dictionary or an array for %@", self.class];
             }
             else if(!HTTPURLResponse.mms_isSuccessful){
                 partialErrors[request] = [self errorFromJSONObject:JSONObject response:HTTPURLResponse];
             }
             if(self.perRequestCompletionBlock){
                 self.perRequestCompletionBlock(request, JSONObject, HTTPURLResponse, error);
             }
         }];
         self.partialErrors = partialErrors.copy;
    }];
    [self addOperation:op];
}

- (void)finishOnCallbackQueueWithError:(NSError *)error{
    if(!error){
        if(self.partialErrors.count){
            error = [MMSError errorWithCode:MMSErrorPartialFailure userInfo:@{MMSPartialErrorsByItemIDKey : self.partialErrors}];
        }
    }
    if(self.batchCompletionBlock){
        self.batchCompletionBlock(error);
    }
    [super finishOnCallbackQueueWithError:error];
}

@end

//@implementation NSMutableURLRequest (MMSBatchRESTOperation)
//
//- (id)mms_identifier{
//    return objc_getAssociatedObject(self, @selector(mms_identifier));
//}
//
//- (void)mms_setIdentifier:(NSString *)identifier{
//    objc_setAssociatedObject(self, @selector(identifier), identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//@end
