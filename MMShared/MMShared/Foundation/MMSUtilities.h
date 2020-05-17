//
//  MMSUtilities.h
//  MMShared
//
//  Created by Malcolm Hall on 19/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

MMS_EXTERN id MMSDynamicCast(Class aClass, id object);
MMS_EXTERN id MMSCheckedDynamicCast(Class aClass, id object);
MMS_EXTERN id MMSProtocolCast(Protocol *protocol, id object);

MMS_EXTERN float MMSDispatchMainAfterDelay(dispatch_block_t block);
MMS_EXTERN void MMSPerformBlockOnMainThread(dispatch_block_t block);

MMS_EXTERN BOOL MMSProtocolHasInstanceMethod(Protocol * protocol, SEL selector);

@interface MMSUtilities : NSObject

+ (struct _NSRange)range:(struct _NSRange)arg1 liesWithinRange:(struct _NSRange)arg2 assert:(BOOL)arg3;

@end

NS_ASSUME_NONNULL_END
