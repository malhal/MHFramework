//
//  UITextField+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 16/01/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import "UITextField+MMS.h"

@implementation UITextField (MMS)

- (UITextInputTraits *)mms_textInputTraits{
    return [self valueForKey:@"textInputTraits"];
}

- (void)mms_setInsertionPointColor:(UIColor *)color{
    [self.mms_textInputTraits setValue:color forKey:@"insertionPointColor"];
}

- (UIColor *)mms_insertionPointColor{
    return [self.mms_textInputTraits valueForKey:@"insertionPointColor"];
}

@end
