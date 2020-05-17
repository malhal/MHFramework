//
//  CKRecordID+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKRecordID+MMS.h"
#import "CKRecordZoneID+MMS.h"

@implementation CKRecordID (MMS)

- (CKDatabaseScope)mms_databaseScope{
    return self.zoneID.mms_databaseScope;
}

- (BOOL)mms_isOwnedByCurrentUser{
    return self.zoneID.mms_isOwnedByCurrentUser;
}

@end
