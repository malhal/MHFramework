//
//  NSMutableDictionary+Nulls.h
//  DataStoreDemo
//
//  Created by Malcolm Hall on 10/11/2014.
//  Copyright (c) 2014 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (MMS)

- (BOOL)mms_setObjectOrNull:(id)anObject forKey:(id)aKey;

@end

NS_ASSUME_NONNULL_END
