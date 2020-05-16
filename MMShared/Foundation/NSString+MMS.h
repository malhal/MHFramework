//
//  NSString+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MMS)

//@property (readonly, nonatomic) NSString *mms_sanitizedFilenameString;
//@property (readonly, nonatomic) NSString *mms_trimmedString;
@property (readonly, nonatomic) NSString *mms_whitespaceAndNewlineCoalescedString;

//- (void)enumerateContentLineRangesInRange:(struct _NSRange)arg1 usingBlock:(CDUnknownBlockType)arg2;
//- (void)enumerateParagraphsInRange:(struct _NSRange)arg1 usingBlock:(CDUnknownBlockType)arg2;
//- (id)mms_stringByReplacingCharactersInSet:(id)set withString:(id)string;
//- (id)mms_stringByReplacingNewlineCharactersWithWhiteSpace;
//- (id)mms_substringFromIndex:(NSUInteger)index;
- (id)mms_substringToIndex:(NSUInteger)index;
//- (id)mms_substringWithRange:(NSRange)range;
//- (NSUInteger)lengthOfLongestLine;
//- (id)md5;
//- (NSUInteger)numberOfLines;
//- (struct _NSRange)paragraphRangeForRange:(struct _NSRange)arg1 contentEnd:(NSUInteger *)arg2;
@end

NS_ASSUME_NONNULL_END
