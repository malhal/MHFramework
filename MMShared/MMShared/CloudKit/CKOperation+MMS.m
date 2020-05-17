//
//  CKOperation+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKOperation+MMS.h"

@implementation CKOperation (MMS)

- (void)mms_removeAllCompletionBlocks{
    self.completionBlock = nil;
}

@end
