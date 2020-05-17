//
//  UIViewController+MMS.h
//  WiFiFoFum-Passwords
//
//  Created by Malcolm Hall on 29/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSSplitItem;

@protocol MMSViewControllerHierarchy <NSObject>

- (BOOL)mms_isMemberOfViewControllerHierarchy:(UIViewController *)vc;

@end

@interface UIViewController (MMS) <MMSViewControllerHierarchy>

@property (nonatomic, assign, setter=mms_setLoading:) BOOL mms_loading;

@property (nonatomic, assign, readonly) BOOL mms_isViewVisible;

// on iPad in a splitview the detail view loads with no detail item. This allows you to
// override default view and when no detail item show a place holder view.
// Then when the detail item is available call this and in load view call super, e.g.
/*
- (void)loadView{
    if(!self.fetchedResultsController){
        self.view = [UIView.alloc init];
        return;
    }
    [super loadView];
}
*/
// Not actually using this because decided to set a default UIViewController on the nav controller at start up instead.
- (void)mms_reloadView;

// reimplementation of private method.
// only works for the controller's view.
+ (__kindof UIViewController *)mms_viewControllerForView:(UIView *)view;

+ (BOOL)mms_doesOverrideViewControllerMethod:(SEL)method;

+ (BOOL)mms_doesOverrideViewControllerMethod:(SEL)method inBaseClass:(Class)aClass;

- (UIViewController *)mms_ancestorViewControllerOfClass:(Class)aClass allowModalParent:(bool)allowModalParent;

- (UIViewController *)mms_childContainingSender:(id)sender;





@end

@interface UIView (MMSViewControllerHierarchy) <MMSViewControllerHierarchy>
@end

//@interface UIBarButtonItem (MMSViewControllerHierarchy) <MMSViewControllerHierarchy>
//@end

NS_ASSUME_NONNULL_END
