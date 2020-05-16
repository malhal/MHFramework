//
//  NSProcessInfo+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 25/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "NSProcessInfo+MMS.h"

@implementation NSProcessInfo (MMS)

- (NSDictionary *)mms_operationSystemVersionDictionary{
    NSOperatingSystemVersion v = self.operatingSystemVersion;
    return @{@"majorVersion" : @(v.majorVersion),
             @"minorVersion" : @(v.minorVersion),
             @"patchVersion" : @(v.patchVersion)};
}

@end
