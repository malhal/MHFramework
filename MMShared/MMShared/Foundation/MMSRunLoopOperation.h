//
//  MMSRunLoopOperation.h
//  MMShared
//
//  Created by Malcolm Hall on 25/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSRunLoopOperation : NSOperation

- (void)willRun;

@end

NS_ASSUME_NONNULL_END
