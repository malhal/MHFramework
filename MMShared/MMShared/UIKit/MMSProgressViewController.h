//
//  MMSProgressViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 22/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSCircularProgressView;

@protocol MMSProgressViewControllerDelegate;

@interface MMSProgressViewController : UIViewController

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) MMSCircularProgressView *circularProgressView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSProgress *observedProgress;
@property (weak, nonatomic) id<MMSProgressViewControllerDelegate> progressDelegate;
@property (nonatomic) BOOL showsCancel;

- (instancetype)initWithDelegate:(id<MMSProgressViewControllerDelegate>)delegate;

@end

@protocol MMSProgressViewControllerDelegate

- (void)willDismissProgressViewController:(MMSProgressViewController *)pvc;

@end


NS_ASSUME_NONNULL_END
