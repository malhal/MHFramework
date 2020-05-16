//
//  CKRecord+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import <MMShared/MMSDefines.h>
#import <MMShared/MMSHasDatabaseScope.h>

MMS_EXTERN NSString * const MMSShareRecordKeyRootRecord;
MMS_EXTERN NSString * const MMSShareRecordKeyRootRecordType;

@interface CKRecord (MMS) <MMSHasDatabaseScope>

@end

