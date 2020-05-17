//
//  NSUndoManager+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUndoManager (MMS)

@property (nonatomic, assign, readonly) BOOL mms_isUndoingOrRedoing;

@end

NS_ASSUME_NONNULL_END
