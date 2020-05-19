//
//  MMSUtilities.cpp
//  MMShared
//
//  Created by Malcolm Hall on 01/10/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import <MMShared/MMSDefines.h>

MMS_EXTERN CKDatabaseScope MMSDatabaseScopeFromString(NSString *string);
MMS_EXTERN NSString * MMSDatabaseScopeString(CKDatabaseScope scope);
