//
//  MMSSignUpViewController.m
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 30/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "MMSSignUpViewController.h"
#import "UIViewController+MMS.h"
#import "MMSEditableTableCell.h"

@implementation MMSSignUpViewController
@dynamic delegate;

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.emailCell.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.emailCell.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailCell.alwaysEditable = YES;
}

- (IBAction)signUpButtonTapped:(id)sender{
    [self didTapSignUpButton];
}

- (void)didTapSignUpButton{
    self.mms_loading = YES;
    
    if([self.delegate respondsToSelector:@selector(signUpViewControllerDidTapSignUpButton:)]){
        [self.delegate signUpViewControllerDidTapSignUpButton:self];
    }
}

@end
