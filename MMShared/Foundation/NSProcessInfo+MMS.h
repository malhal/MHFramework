//
//  NSProcessInfo+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 25/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSProcessInfo (MMS)

@property (copy, readonly) NSDictionary *mms_operationSystemVersionDictionary;

@end

NS_ASSUME_NONNULL_END
