//
//  MMSError_Internal.h
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 24/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <MMShared/MMSError.h>

@interface MMSError : NSError

+ (instancetype)errorWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo;

@end
