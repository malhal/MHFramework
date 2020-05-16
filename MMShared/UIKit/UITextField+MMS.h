//
//  UITextField+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 16/01/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (MMS)

@property (nonatomic, strong, setter=mms_setInsertionPointColor:) UIColor *mms_insertionPointColor;

@property (nonatomic, strong, readonly) NSObject<UITextInputTraits> *mms_textInputTraits;

@end

NS_ASSUME_NONNULL_END
