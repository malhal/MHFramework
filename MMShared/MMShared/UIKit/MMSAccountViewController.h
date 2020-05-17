//
//  MMSAccountViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 11/04/2015.
//  Copyright (c) 2015 Malcolm Hall. All rights reserved.
//

// this controller is used for all 3 views in the Auth storyboard. So that the cancel button can be hooked up to an action to dismiss. Adn so the same logic can be used for the textfields that are duplicated.

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>
#import <MMShared/MMSLogInViewController.h>
#import <MMShared/MMSSignUpViewController.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMSAccountViewControllerDelegate;

@interface MMSAccountViewController : UITableViewController <MMSLogInViewControllerDelegate, MMSSignUpViewControllerDelegate>

// presents the auth UI with log in and sign up options. The AuthViewController to set the container on is in topViewController.
//+(UINavigationController *)presentFromViewController:(UIViewController*)viewController;

// the alert will be presented from the supplied view controller. Completion handler is fired after the alert is closed which you can use to refresh UI.
//- (void)logoutWithConfirmationFromViewController:(UIViewController*)viewController completionHandler:(void(^)(void))completionHandler;

@property (nonatomic, weak) id <MMSAccountViewControllerDelegate> delegate;

@end

@protocol MMSAccountViewControllerDelegate <NSObject>

@optional

- (void)accountViewControllerDidCancel:(MMSAccountViewController *)accountViewController;

- (void)accountViewController:(MMSAccountViewController *)accountViewController logInViewController:(MMSLogInViewController *)logInOrSignUp didError:(NSError *)error;
- (void)accountViewController:(MMSAccountViewController *)accountViewController logInViewControllerDidTapLogInButton:(MMSLogInViewController *)logInOrSignUp;
- (void)accountViewController:(MMSAccountViewController *)accountViewController logInViewControllerDidFinish:(MMSLogInViewController *)logInOrSignUp;
- (void)accountViewController:(MMSAccountViewController *)accountViewController signUpViewControllerDidTapSignUpButton:(MMSSignUpViewController *)signUp;

@end

NS_ASSUME_NONNULL_END
