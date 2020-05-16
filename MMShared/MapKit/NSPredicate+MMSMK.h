//
//  NSPredicate+Region.h
//  MMShared
//
//  Created by Malcolm Hall on 26/04/2015.
//  Copyright (c) 2015 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <MMShared/MMSDefines.h>

@interface NSPredicate (MMSMK)

+ (NSPredicate *)mms_predicateWithCoordinateRegion:(MKCoordinateRegion)region;
+ (NSPredicate *)mms_predicateWithCoordinateRegion:(MKCoordinateRegion)region keyPrefix:(NSString *)keyPrefix;

@end
