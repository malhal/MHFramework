//
//  MMSSplitViewController.m
//  MMShared
//
//  Created by Malcolm Hall on 26/11/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "MMSSplitViewController+Private.h"
#import "UIViewController+MMS.h"
#import <objc/runtime.h>

NSString * const UIViewControllerCurrentDetailModelIdentifierDidChangeNotification = @"UIViewControllerCurrentDetailModelIdentifierDidChangeNotification";

@interface MMSSplitViewController ()

@property (strong, nonatomic, setter=mms_setDetailShownViewController:) UIViewController *mms_detailShownViewController;

@end

@interface UIViewController (MMSSplitViewController)

@end

@implementation MMSSplitViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    //self.childViewControllers.lastObject.showingTabSplitViewController = self;
    NSAssert(self.childViewControllers.count == 2, @"Needs 2 children");
    UIViewController *vc = self.childViewControllers.lastObject;
    //vc.mms_detailShowingViewController = self;
    _mms_detailShownViewController = vc;
    vc.mms_detailShowingViewController = self;
}

- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender{
    [super showDetailViewController:vc sender:sender];
    //vc.mms_detailShowingViewController = self;
    self.mms_detailShownViewController = vc;
    
}

- (void)mms_setDetailShownViewController:(UIViewController *)vc{
    if(vc == _mms_detailShownViewController){
        return;
    }
    else if(_mms_detailShownViewController.mms_detailShowingViewController == self){
        _mms_detailShownViewController.mms_detailShowingViewController = nil;
    }
    _mms_detailShownViewController = vc;
    vc.mms_detailShowingViewController = self;
    [self mms_viewControllerUpdatedDetailModelIdentifier:vc];
}

@end

@implementation UIViewController (MMSSplitViewController)

- (void)mms_viewControllerUpdatedDetailModelIdentifier:(UIViewController *)vc{
    NSString *s = vc.mms_detailModelIdentifier;
    NSDictionary *userInfo;
    if(s){
        userInfo = @{@"DetailModelIdentifier" : s};
    }
    [NSNotificationCenter.defaultCenter postNotificationName:UIViewControllerCurrentDetailModelIdentifierDidChangeNotification object:self userInfo:userInfo];
}

- (NSString *)mms_currentDetailModelIdentifier{
    return self.mms_detailShownViewController.mms_detailModelIdentifier;
}

//- (NSString *)mms_currentDetailModelIdentifier{
//    return objc_getAssociatedObject(self, @selector(mms_currentDetailModelIdentifier));
//}
//
//- (void)mms_setCurrentDetailModelIdentifier:(NSString *)identifier{
//    objc_setAssociatedObject(self, @selector(mms_currentDetailModelIdentifier), identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}

- (UIViewController *)mms_detailShowingViewController{
    return objc_getAssociatedObject(self, @selector(mms_detailShowingViewController));
}

- (void)mms_setDetailShowingViewController:(MMSSplitViewController *)svc{
    //[self willChangeValueForKey:kSplitItemKeyPath];
    if(svc == self.mms_detailShowingViewController){
        return;
    }
    objc_setAssociatedObject(self, @selector(mms_detailShowingViewController), svc, OBJC_ASSOCIATION_ASSIGN);
    //[svc mms_viewControllerUpdatedDetailModelIdentifier:self];
   // [self.showingTabSplitViewController viewControllerUpdatedDetailModelIdentifier:splitItem];
    //[self didChangeValueForKey:kSplitItemKeyPath];
    //[NSNotificationCenter.defaultCenter postNotificationName:MMSSplitViewControllerDidChangeSplitItem object:self userInfo:nil];
}

- (void)mms_setDetailModelIdentifier:(NSString *)identifier{
    if([identifier isEqualToString:self.mms_detailModelIdentifier]){
        return;
    }
    //[self willChangeValueForKey:kSplitItemKeyPath];
    objc_setAssociatedObject(self, @selector(mms_detailModelIdentifier), identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self.mms_detailShowingViewController mms_viewControllerUpdatedDetailModelIdentifier:self]; // does nothing if not shownDetail yet
   // [self.showingTabSplitViewController viewControllerUpdatedDetailModelIdentifier:splitItem];
    //[self didChangeValueForKey:kSplitItemKeyPath];
    //[NSNotificationCenter.defaultCenter postNotificationName:MMSSplitViewControllerDidChangeSplitItem object:self userInfo:nil];
}

- (NSString *)mms_detailModelIdentifier{
    return objc_getAssociatedObject(self, @selector(mms_detailModelIdentifier));
}

- (MMSSplitViewController *)mms_splitViewController{
    UISplitViewController *svc = self.splitViewController;
    if([svc isKindOfClass:MMSSplitViewController.class]){
        return (MMSSplitViewController *)svc;
    }
    return svc.mms_splitViewController;
}

@end
