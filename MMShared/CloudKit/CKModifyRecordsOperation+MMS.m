//
//  CKModifyRecordsOperation+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKModifyRecordsOperation+MMS.h"

@implementation CKModifyRecordsOperation (MMS)

- (void)mms_removeAllCompletionBlocks{
    [super mms_removeAllCompletionBlocks];
    self.perRecordProgressBlock = nil;
    self.perRecordProgressBlock = nil;
    self.modifyRecordsCompletionBlock = nil;
}

@end
