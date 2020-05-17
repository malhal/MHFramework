//
//  NSOperationQueue+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 13/10/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSOperationQueue (MMS)

// adds and makes dependendent on the last on the queue.
- (void)mms_addSerialOperation:(NSOperation *)op;

// a shared operation queue for use across an application's view controllers.
+ (NSOperationQueue *)mms_sharedOperationQueue;

@end

NS_ASSUME_NONNULL_END
