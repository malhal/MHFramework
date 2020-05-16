//
//  NSURLSession+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 04/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSURLSession+MMS.h"

@implementation NSURLSession (MMS)

- (void)mms_cancelAllTasks{
    [self getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        for(NSURLSessionDataTask* task in dataTasks){
            [task cancel];
        }
        for(NSURLSessionDataTask* task in uploadTasks){
            [task cancel];
        }
        for(NSURLSessionDataTask* task in downloadTasks){
            [task cancel];
        }
    }];
}

+ (NSURLSession *)mms_sharedSessionMainQueueAllowInvalidSSL{
    static NSURLSession* sharedSessionMainQueueAllowInvalidSSL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSessionMainQueueAllowInvalidSSL = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:[[MMSURLSessionAllowInvalidSSLDelegate alloc] init] delegateQueue:[NSOperationQueue mainQueue]];
    });
    return sharedSessionMainQueueAllowInvalidSSL;
}

+ (NSURLSession *)mms_sharedSessionMainQueue{
    static NSURLSession *sharedSessionMainQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSessionMainQueue = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    });
    return sharedSessionMainQueue;
}

@end

@implementation MMSURLSessionAllowInvalidSSLDelegate

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler{
    //this is how you accept anything, I believe.
    completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]);
}

@end
