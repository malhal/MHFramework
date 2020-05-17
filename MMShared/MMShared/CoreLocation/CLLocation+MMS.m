//
//  CLLocation+dictionary.m
//  PhoneLog
//
//  Created by Malcolm Hall on 22/01/2009.
//  Malcolm Hall. All rights reserved.
//

#import "CLLocation+MMS.h"

@implementation CLLocation (MMS)

-(NSDictionary*)mms_dictionaryWithSnakeAttributes:(BOOL)snakeAttributes{
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithDouble: self.altitude], @"altitude",
                                 [NSNumber numberWithDouble: self.coordinate.latitude], @"latitude",
                                 [NSNumber numberWithDouble: self.coordinate.longitude], @"longitude",
                                 [NSNumber numberWithDouble: self.horizontalAccuracy], snakeAttributes ? @"horizontal_accuracy" : @"horizontalAccuracy",
                                 [NSNumber numberWithDouble: [self.timestamp timeIntervalSince1970]], @"timestamp",
                                 [NSNumber numberWithDouble: self.verticalAccuracy], snakeAttributes ? @"vertical_accuracy" : @"verticalAccuracy",
                                 nil];
    
    //new 2.2 properties
    if([self respondsToSelector:@selector(course)]){
        // a negative course means invalid
        if([self course] >= 0){
            [dict setObject:[NSNumber numberWithDouble: [self course]] forKey: @"course"];
        }
    }
    if([self respondsToSelector:@selector(speed)]){
        // a negative speed means invalid
        if([self speed] >= 0){
            [dict setObject:[NSNumber numberWithDouble: [self speed]] forKey: @"speed"];
        }
    }
    if([self respondsToSelector:@selector(floor)]){
        dict[@"floor"] = [NSNumber numberWithInteger:self.floor.level];
    }
    
    return dict;
    
    /* // nested coordinate
     [NSDictionary dictionaryWithObjectsAndKeys:
     [NSNumber n: self.coordinate.latitude], @"latitude",
     [NSNumber numberWithDouble: self.coordinate.longitude], @"longitude",
     nil], @"coordinate",
     */
}

-(NSDictionary*)mms_dictionary{
    return [self mms_dictionaryWithSnakeAttributes:YES];
}

+ (CLLocation *)mms_locationFromDictionary:(NSDictionary *)d{
    return [CLLocation mms_locationFromDictionary:d snakeAttributes:YES];
}

+ (CLLocation *)mms_locationFromDictionary:(NSDictionary *)d snakeAttributes:(BOOL)snakeAttributes{
	double alt = [[d valueForKey:@"altitude"] doubleValue];
	double lat = [[d valueForKey:@"latitude"] doubleValue];
	double lon = [[d valueForKey:@"longitude"] doubleValue];
    double horacc = [[d valueForKey:snakeAttributes ? @"horizontal_accuracy" : @"horizontalAccuracy"] doubleValue];
	NSTimeInterval ts = [[d valueForKey:@"timestamp"] doubleValue];
    double veracc = [[d valueForKey: snakeAttributes ? @"vertical_accuracy" : @"verticalAccuracy"] doubleValue];
	CLLocationCoordinate2D coord;
	coord.latitude = lat;
	coord.longitude = lon;
	return [[CLLocation alloc] initWithCoordinate:coord altitude:alt horizontalAccuracy:horacc verticalAccuracy:veracc timestamp:[NSDate dateWithTimeIntervalSince1970:ts]];
}

@end
