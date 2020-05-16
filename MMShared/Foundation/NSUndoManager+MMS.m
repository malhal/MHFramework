//
//  NSUndoManager+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 19/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "NSUndoManager+MMS.h"

@implementation NSUndoManager (MMS)

- (BOOL)mms_isUndoingOrRedoing{
    return self.isUndoing || self.isRedoing;
}

@end
