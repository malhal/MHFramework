//
//  CKRecordZoneID+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "CKRecordZoneID+MMS.h"

@implementation CKRecordZoneID (MMS)

- (CKDatabaseScope)mms_databaseScope{
    if(self.mms_isOwnedByCurrentUser){
        return CKDatabaseScopePrivate;
    }
    return CKDatabaseScopeShared;
}

- (BOOL)mms_isOwnedByCurrentUser{
    return [self.ownerName isEqualToString:CKCurrentUserDefaultName];
}

@end
