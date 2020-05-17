//
//  UIViewController+MMS.m
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 29/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "UIViewController+MMS.h"
#import "UINavigationItem+MMS.h"
#import <objc/runtime.h>
#import "UIView+MMS.h"
#import "UIBarButtonItem+MMS.h"
#import "UIResponder+MMS.h"

@implementation UIViewController (MMS)

- (void)mms_setLoading:(BOOL)loading{
    BOOL mms_loading = [objc_getAssociatedObject(self, @selector(mms_loading)) boolValue];
    if(loading == mms_loading){
        return;
    }
    self.view.userInteractionEnabled = !loading;
    self.navigationItem.rightBarButtonItem.enabled = !loading;
    self.navigationItem.hidesBackButton = loading;
    if(loading){
        [self.navigationItem mms_beginTitleRefreshing];
    }else{
        [self.navigationItem mms_endTitleRefreshing];
    }
    NSString* keyPath = NSStringFromSelector(@selector(mms_loading));
    [self willChangeValueForKey:keyPath];
    objc_setAssociatedObject(self, @selector(mms_loading), @(loading), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:keyPath];
}

- (BOOL)mms_loading{
    return [objc_getAssociatedObject(self, @selector(mms_loading)) boolValue];
}

- (BOOL)mms_isViewVisible{
    return self.isViewLoaded && self.view.window;
}

- (void)mms_reloadView{
    UIView *view = self.viewIfLoaded;
    BOOL callAppearanceMethods = self.parentViewController && !self.parentViewController.shouldAutomaticallyForwardAppearanceMethods;
    UIView *superview = view.superview;
    if(callAppearanceMethods){
        [self beginAppearanceTransition:NO animated:NO];
    }
    [view removeFromSuperview];
    if(callAppearanceMethods){
        [self endAppearanceTransition];
    }
    self.view = nil;
    view = self.view;
    // workaround for nav controller and tab controller not forwarding viewWillAppear
    if(callAppearanceMethods){
        [self beginAppearanceTransition:YES animated:NO];
    }
    [superview addSubview:view];
    if(callAppearanceMethods){
        [self endAppearanceTransition];
    }
}

+ (__kindof UIViewController *)mms_viewControllerForView:(UIView *)view{
    // doesn't work on UITableViewCell
    return [view valueForKey:@"_viewDelegate"];
}

+ (BOOL)mms_doesOverrideViewControllerMethod:(SEL)method{
    return [self mms_doesOverrideViewControllerMethod:method inBaseClass:UIViewController.class];
}

+ (BOOL)mms_doesOverrideViewControllerMethod:(SEL)method inBaseClass:(Class)aClass{
    return class_getMethodImplementation(self, method) !=  class_getMethodImplementation(aClass, method);
}

- (UIViewController *)mms_ancestorViewControllerOfClass:(Class)aClass allowModalParent:(bool)allowModalParent{
    UIViewController *parent = self.parentViewController;
    if(!parent && allowModalParent){
        parent = self.presentingViewController;
    }
    if(!parent){
        return nil;
    }
    else if(![parent isKindOfClass:aClass]){
        return [parent mms_ancestorViewControllerOfClass:aClass allowModalParent:allowModalParent];
    }
    return parent;
}

- (BOOL)mms_isMemberOfViewControllerHierarchy:(UIViewController *)highViewController{
    UIViewController *vc = self;
    while(vc){
        if(vc == highViewController){
            return YES;
        }
        vc = vc.parentViewController;
    }
    return NO;
}

- (UIViewController *)mms_childContainingSender:(id)sender{
    // check the detail first because when collapsed the sender will also be in the master's hierarchy.
    for(UIViewController *vc in self.childViewControllers){
        if(![sender conformsToProtocol:@protocol(MMSViewControllerHierarchy)]){
            continue;
        }
        else if(![sender mms_isMemberOfViewControllerHierarchy:vc]){
            continue;
        }
        return vc;
    }
    return nil;
}




@end

@implementation UIView (MMSViewControllerHierarchy)

- (BOOL)mms_isMemberOfViewControllerHierarchy:(UIViewController *)vc{
    UIView *view = vc.viewIfLoaded;
    if(!view){
        return NO;
    }
    return [self isDescendantOfView:view];
}

@end

//@implementation UIBarButtonItem (MMSViewControllerHierarchy)
//
//- (BOOL)mms_isMemberOfViewControllerHierarchy:(UIViewController *)vc{
//    return [self.mms_viewController mms_isMemberOfViewControllerHierarchy:vc];
//}
//
//@end
