//
//  MMSCompletionStoryboardSegue.m
//  MMShared
//
//  Created by Malcolm Hall on 20/09/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "MMSCompletionStoryboardSegue.h"

@implementation MMSCompletionStoryboardSegue

- (void)perform{
    [super perform];
    if(!self.completion){
        return;
    }
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.destinationViewController.transitionCoordinator;
    if(!transitionCoordinator){
        self.completion();
        return;
    }
    [self.destinationViewController.transitionCoordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if(!context.isCancelled){
          self.completion();
        }
    }];
}

@end
