//
//  MMSAnimationFixStoryboardSegue.m
//  RootMasterDetail
//
//  Created by Malcolm Hall on 07/11/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "MMSAnimationFixStoryboardSegue.h"

@interface MMSAnimationFixStoryboardSegue()

@property (assign, nonatomic) BOOL disableAnimations;

@end

@implementation MMSAnimationFixStoryboardSegue

- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination{
    self = [super initWithIdentifier:identifier source:source destination:destination];
    if (self) {
        if(!UIView.areAnimationsEnabled){
            _disableAnimations = YES;
        }
    }
    return self;
}

- (void)perform{
    if(self.disableAnimations){
        [UIView setAnimationsEnabled:NO];
    }
    [super perform];
}

@end
