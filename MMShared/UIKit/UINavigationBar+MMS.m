//
//  UINavigationBar+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 05/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "UINavigationBar+MMS.h"
#import <objc/runtime.h>

@implementation UINavigationBar (MMS)

- (UIProgressView*)mms_progressView{
    // find prev instance
    UIProgressView *progress = objc_getAssociatedObject(self, "mms_progressView");
    if(!progress){
        progress = [UIProgressView.alloc initWithProgressViewStyle:UIProgressViewStyleBar];
        [self addSubview:progress];
        // pin to bottom
        [progress.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [progress.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [progress.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        progress.translatesAutoresizingMaskIntoConstraints = NO;
        // remember it
        objc_setAssociatedObject(self, "mms_progressView", progress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return progress;
}

@end
