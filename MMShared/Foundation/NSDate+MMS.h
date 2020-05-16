//
//  NSDate+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 23/07/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

@interface NSDate (MMS)

- (BOOL)mms_isLaterThanOrEqualToDate:(NSDate *)date;

- (BOOL)mms_isEarlierThanOrEqualToDate:(NSDate *)date;

- (BOOL)mms_isLaterThanDate:(NSDate *)date;

- (BOOL)mms_isEarlierThanDate:(NSDate *)date;

// e.g. "2014-11-14 17:47:33"
- (NSString *)mms_MySQLString;

// for new MySQL TIMESTAMP(6) e.g. "2014-11-14 17:47:33.326594" that's 6 decimal places
- (NSString *)mms_fractionalMySQLString;

// handles fractional and not e.g. "2014-11-14 17:47:33" and "2014-11-14 17:47:33.326594"
+ (NSDate *)mms_dateFromMySQLString:(NSString *)utcString;

@end
