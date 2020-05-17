//
//  NSHTTPURLResponse+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 10/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

@interface NSHTTPURLResponse (MMS)

- (BOOL)mms_isSuccessful;

- (NSError *)mms_HTTPErrorWithUserInfo:(NSDictionary *)userInfo;

@end
