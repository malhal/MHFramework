//
//  MMSHasDatabaseScope.h
//  MMShared
//
//  Created by Malcolm Hall on 21/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import <MMShared/MMSDefines.h>

@protocol MMSHasDatabaseScope <NSObject>

- (CKDatabaseScope)mms_databaseScope;
- (BOOL)mms_isOwnedByCurrentUser;

@end

