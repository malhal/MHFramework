//
//  CKRecord+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKRecord+MMS.h"
#import "CKRecordID+MMS.h"

NSString * const MMSShareRecordKeyRootRecord = @"RootRecord";
NSString * const MMSShareRecordKeyRootRecordType = @"RootRecordType";

@implementation CKRecord (MMS)

- (CKDatabaseScope)mms_databaseScope{
    return self.recordID.mms_databaseScope;
}

- (BOOL)mms_isOwnedByCurrentUser{
    return self.recordID.mms_isOwnedByCurrentUser;
}

@end
