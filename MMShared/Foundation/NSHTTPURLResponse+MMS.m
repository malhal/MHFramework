//
//  NSHTTPURLResponse+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 10/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSHTTPURLResponse+MMS.h"
#import "MMSHTTPError.h"

@implementation NSHTTPURLResponse (MMS)

- (BOOL)mms_isSuccessful{
    return self.statusCode >= 200 && self.statusCode < 300;
}

- (NSError *)mms_HTTPErrorWithUserInfo:(NSDictionary *)userInfo{
    return [MMSHTTPError HTTPErrorWithStatusCode:self.statusCode userInfo:userInfo];
}

@end
