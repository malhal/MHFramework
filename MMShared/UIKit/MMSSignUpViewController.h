//
//  MMSSignUpViewController.h
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 30/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>
#import <MMShared/MMSLogInViewController.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSSignUpViewController;
@class MMSEditableTableCell;

@protocol MMSSignUpViewControllerDelegate <NSObject, MMSLogInViewControllerDelegate>

@optional

- (void)signUpViewControllerDidTapSignUpButton:(MMSSignUpViewController *)viewController;

@end

@interface MMSSignUpViewController : MMSLogInViewController

@property (nonatomic, weak, nullable) id <MMSSignUpViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet MMSEditableTableCell *emailCell;

//@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField; // todo

- (IBAction)signUpButtonTapped:(id)sender;

- (void)didTapSignUpButton;

@end

NS_ASSUME_NONNULL_END
