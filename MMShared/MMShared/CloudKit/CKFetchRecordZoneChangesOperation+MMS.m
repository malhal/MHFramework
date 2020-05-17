//
//  CKFetchRecordZoneChangesOperation+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKFetchRecordZoneChangesOperation+MMS.h"

@implementation CKFetchRecordZoneChangesOperation (MMS)

- (void)mms_removeAllCompletionBlocks{
    [super mms_removeAllCompletionBlocks];
    self.recordChangedBlock = nil;
    self.recordWithIDWasDeletedBlock = nil;
    self.fetchRecordZoneChangesCompletionBlock = nil;
    self.recordZoneFetchCompletionBlock = nil;
    self.recordZoneChangeTokensUpdatedBlock = nil;
}

@end
