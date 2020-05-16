//
//  NSUUID+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 05/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

@interface NSUUID (MMS)

// note this requires a case-sensitive database column.
- (NSString *)mms_URLSafeBase64String;

@end
