//
//  CLLocation+dictionary.h
//  PhoneLog
//
//  Created by Malcolm Hall on 22/01/2009.
//  Malcolm Hall. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MMShared/MMSDefines.h>

@interface CLLocation (MMS)

//added so it compiles on 2.0
// removed because we no longer compile for anything before 3.0
//-(double) course;
//-(double) speed;

// Now doesnt include course or speed if they are invalid

// uses snaked attirbutes by default
- (NSDictionary *)mms_dictionary;
+ (CLLocation *)mms_locationFromDictionary:(NSDictionary *)d;

// use false for camel case.
- (NSDictionary *)mms_dictionaryWithSnakeAttributes:(BOOL)snakeAttributes;
+ (CLLocation *)mms_locationFromDictionary:(NSDictionary *)d snakeAttributes:(BOOL)snakeAttributes;

@end
