//
//  UIAlertView+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 13/10/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "UIAlertView+MMS.h"

@implementation UIAlertView (MMS)

+ (void)mms_showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate{
    if(!title){
        //use the app's name
        title = [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"];
        if(!title){
            title = [[NSProcessInfo processInfo] processName];
        }
    }
    
    /* open an alert with an OK button */
    UIAlertView *alert;
    if(delegate){
        alert = [UIAlertView.alloc initWithTitle:title
                                           message:message
                                          delegate:delegate
                                 cancelButtonTitle:@"Cancel"
                                 otherButtonTitles:@"OK", nil];
    }else{
        alert = [UIAlertView.alloc initWithTitle:title
                                           message:message
                                          delegate:delegate
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    }
    [alert show];
}

+ (void)mms_showAlertWithTitle:(NSString *)title message:(NSString *)message{
    [UIAlertView mms_showAlertWithTitle:title message:message delegate:nil];
}

+ (void)mms_showAlertWithMessage:(NSString *)message{
    [UIAlertView mms_showAlertWithTitle:nil message:message];
}


+ (void)mms_showAlertWithError:(NSError *)error
{
    id reason = [error localizedFailureReason];
    if(!reason){
        reason = error.userInfo;
    }
    
    NSString *message = [NSString stringWithFormat:@"Error! %@ %@",
                         [error localizedDescription],
                         reason];
    
    [UIAlertView mms_showAlertWithMessage:message];
}


+ (void)mms_showAlertWithMessage:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate{
    [UIAlertView mms_showAlertWithTitle:nil message:message delegate:nil];
}

@end
