//
//  UIView+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 08/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MHViewAnimationTransitionSlide) {
    MHViewAnimationTransitionSlideToFromLeft,
    MHViewAnimationTransitionSlideToFromRight,
    MHViewAnimationTransitionSlideToFromTop,
    MHViewAnimationTransitionSlideToFromBottom,
};

@interface UIView (MMS)

// set this as backgroundView on tableView to have a table that matches the look of a nav bar or toolbar. Also set backgroundColor to clear.
- (UIVisualEffectView *)mms_createBlurredBackgroundView;

- (void)mms_setHidden:(BOOL)hidden animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion;

// Slides a view on and off screen, using the width or height of the view as the amount to move, so it assumes the view is on the edge of the screen.
// This is designed to overcome the limitation of CATransitions that force a fade aswell as a move.
// The 
- (void)mms_transitionSlide:(MHViewAnimationTransitionSlide)transitionSlide completion:(void (^ __nullable)(BOOL finished))completion;

@end


NS_ASSUME_NONNULL_END
