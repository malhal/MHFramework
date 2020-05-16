//
//  MMSDetailViewManager.m
//  RootMMSMasterDetail
//
//  Created by Malcolm Hall on 10/12/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//
// MMSSplitCollapseController or MMSDetailViewManager

#import "MMSDetailViewManager.h"
#import <objc/runtime.h>
#import "UIViewController+MMS.h"
#import <objc/runtime.h>
#import "UIViewController+MMSDetailItem.h"

NSString * const MMSDetailViewManagerWillShowDetailViewControllerNotification = @"MMSDetailViewManagerWillShowDetailViewControllerNotification";

@interface UISplitViewController ()

//@property (strong, nonatomic, readwrite, setter=mms_setCurrentSplitDetailItem:) MMSSplitDetailItem *mms_currentSplitDetailItem;

//@property (strong, nonatomic, readwrite, setter=mms_setDetailViewController:) UIViewController *mms_detailViewController;

@property (weak, nonatomic, readwrite, setter=mms_setCollapseController:) MMSDetailViewManager *mms_detailViewManager;

@end

@interface UIViewController ()

//@property (weak, nonatomic, readwrite, setter=mms_setCollapseControllerForMaster:) MMSDetailViewManager *mms_detailViewManagerForMaster;
//@property (weak, nonatomic, readwrite, setter=mms_setCollapseControllerForDetail:) MMSDetailViewManager *mms_detailViewManagerForDetail;

@end

//@implementation MMSSplitDetailItem
//
//@end

@interface MMSDetailViewManager()

@property (strong, nonatomic, readwrite) UIViewController *detailViewController;

@end

@implementation MMSDetailViewManager

//- (id<UIStateRestoring>)restorationParent{
//    return self.splitViewController;
//}
//
//- (void)encodeRestorableStateWithCoder:(NSCoder *)coder{
//    [coder encodeObject:self.masterViewController forKey:@"MasterViewController"];
// //   [coder encodeObject:self.detailItem forKey:@"DetailItem"];
//}
//
//- (void)decodeRestorableStateWithCoder:(NSCoder *)coder{
//    self.masterViewController = [coder decodeObjectForKey:@"MasterViewController"];
//  //  self.detailItem = [coder decodeObjectForKey:@"DetailItem"];
//}

- (instancetype)initWithSplitViewController:(UISplitViewController *)splitViewController{
    self = [super init];
    if (self) {
        //NSAssert([splitViewController.viewControllers.firstObject isKindOfClass:MMSRootNavigationController.class], @"Primary must be instance of MMSRootNavigationController");
        splitViewController.delegate = self;
        splitViewController.mms_detailViewManager = self;
        _splitViewController = splitViewController;
        NSAssert(splitViewController.viewControllers.count == 2, @"splitViewController must have 2 child view controllers");
        _detailViewController = splitViewController.viewControllers.lastObject;
        //splitViewController.mms_currentSplitDetailItem = splitViewController.viewControllers[1].mms_splitDetailItem;
       // splitViewController.mms_detailViewController = splitViewController.viewControllers[1];
    }
    return self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController showDetailViewController:(UIViewController *)vc sender:(id)sender{
    //splitViewController.mms_currentSplitDetailItem = vc.mms_splitDetailItem;
    self.detailViewController = vc;
    [NSNotificationCenter.defaultCenter postNotificationName:MMSDetailViewManagerWillShowDetailViewControllerNotification object:self];
    return NO;
}

// not called from showDetail
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController showViewController:(UIViewController *)vc sender:(id)sender{
//    return NO;
//}

// we throw away detail if not on the master or the master does not contain the current detail item.
- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
//    if ([self.masterViewController mms_isMemberOfViewControllerHierarchy:primaryViewController] && [self.masterViewController containsDetailItem:self.detailViewController.detailItem]){
//        return NO;
//    }
//    return YES;
    //return NO;
    id object = secondaryViewController.mms_containedDetailItem;
    if (!object) {
        // If our secondary controller doesn't show a photo, do the collapse ourself by doing nothing
        return YES;
    }
    // check in reverse if there are any that can select it
    //BOOL b = YES;
    // Before collapsing, remove any view controllers on our stack that don't match the photo we are about to merge on
    ///if ([primaryViewController isKindOfClass:[UINavigationController class]]) {
        //NSMutableArray *viewControllers = [NSMutableArray array];
//        for (UIViewController *controller in [(UINavigationController *)primaryViewController viewControllers]) {
//            if (![controller aapl_canSelectPhoto:photo]) {
//                //[viewControllers addObject:controller];
//                return YES;
//            }
//        }
 //       UINavigationController *pcn = (UINavigationController *)primaryViewController;
        
        //if(pcn.viewControllers.lastObject.aapl_containedPhoto == photo)
        
    else if(![primaryViewController mms_containsDetailItem:object]){
        return YES;
    }
        
//        for (UIViewController *controller in pcn.viewControllers.reverseObjectEnumerator) {
//             if (![controller aapl_canSelectPhoto:photo]) {
//                 //[viewControllers addObject:controller];
//                 //b = NO;
//                  return YES;
//             }
//         }
        
        //[(UINavigationController *)primaryViewController setViewControllers:viewControllers];
  //  }
    //return b;
    return NO;
}

//- (UIViewController *)splitViewController:(UISplitViewController *)splitViewController separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController{
//    NSLog(@"");
//    return nil;
//}

@end

@implementation UIViewController (MMSDetailViewManager)

@end

@implementation UISplitViewController (MMSDetailViewManager)

- (MMSDetailViewManager *)mms_detailViewManager{
    return objc_getAssociatedObject(self, @selector(mms_detailViewManager));
}

- (void)mms_setCollapseController:(MMSDetailViewManager *)detailViewManager {
    objc_setAssociatedObject(self, @selector(mms_detailViewManager), detailViewManager, OBJC_ASSOCIATION_ASSIGN);
}

@end
