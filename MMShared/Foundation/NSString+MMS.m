//
//  NSString+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 19/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//
#import "NSString+MMS.h"

@implementation NSString (MMS)

#pragma mark - Properties

- (NSString *)mms_whitespaceAndNewlineCoalescedString{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression.alloc initWithPattern:@"[\r\n\\s]+" options:0 error:nil];
    });
    return [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:@" "];
}

// test
- (id)mms_substringToIndex:(NSUInteger)index{
    if(!self.length){
        return self.copy;
    }
    NSUInteger maxIndex = self.length - 1;
    if (index > maxIndex) {
        index = maxIndex;
    }
    NSRange range = [self rangeOfComposedCharacterSequenceAtIndex:index];
    return [self substringToIndex:index + range.location];
}

@end
