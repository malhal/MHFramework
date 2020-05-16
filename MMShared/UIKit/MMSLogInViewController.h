//
//  MMSharedAuthActionViewController.h
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 30/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSEditableTableCell;
@protocol MMSLogInViewControllerDelegate;

@interface MMSLogInViewController : UITableViewController

@property (nonatomic, weak) id<MMSLogInViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet MMSEditableTableCell *usernameCell;
@property (weak, nonatomic) IBOutlet MMSEditableTableCell *passwordCell;

- (IBAction)logInButtonTapped:(id)sender;

- (void)didTapLogInButton;

// call when finished to dismiss the controller.
- (void)didFinish;

// shows the alert as an error.
- (void)didError:(NSError*)error;

@end

@protocol MMSLogInViewControllerDelegate <NSObject>

@optional

- (void)logInViewControllerDidFinish:(MMSLogInViewController *)viewController;
- (void)logInViewController:(MMSLogInViewController *)viewController didError:(NSError *)error;
- (void)logInViewControllerDidTapLogInButton:(MMSLogInViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
