//
//  CKFetchDatabaseChangesOperation+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKFetchDatabaseChangesOperation+MMS.h"

@implementation CKFetchDatabaseChangesOperation (MMS)

- (void)mms_removeAllCompletionBlocks{
    [super mms_removeAllCompletionBlocks];
    self.recordZoneWithIDChangedBlock = nil;
    self.recordZoneWithIDWasDeletedBlock = nil;
    self.fetchDatabaseChangesCompletionBlock = nil;
}

@end
