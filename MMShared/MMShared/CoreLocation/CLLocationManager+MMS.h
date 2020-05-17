//
//  CLLocationManager+Authorization.h
//  MMShared
//
//  Created by Malcolm Hall on 20/04/2015.
//  Copyright (c) 2015 Malcolm Hall. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLLocationManager (MMS)

// checks if the Info plist is configured correctly and requests the appropriate authorization depending on plist contents.
// NSLocationWhenInUseUsageDescription
+ (void)mms_requestLocationAuthorizationIfNotDetermined;

@end

NS_ASSUME_NONNULL_END
