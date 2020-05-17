//
//  UIViewController+MMSDetailItem.m
//  MMShared
//
//  Created by Malcolm Hall on 30/10/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "UIViewController+MMSDetailItem.h"

@implementation UIViewController (MMSDetailItem)

- (id)mms_containedDetailItem{
  //  return objc_getAssociatedObject(self, @selector(mms_detailItem));
    return nil;
}

- (BOOL)mms_containsDetailItem:(id)object{
    return NO;
}

//- (UIBarButtonItem *)mms_currentDisplayModeButtonItemWithSender:(id)sender{
//    UIViewController *target = [self targetViewControllerForAction:@selector(mms_currentDisplayModeButtonItemWithSender:) sender:sender];
//    if (target) {
//        return [target mms_currentDisplayModeButtonItemWithSender:sender];
//    } else {
//        return nil;
//    }
//}

//- (void)mms_showDetailDetailViewController:(UIViewController *)vc sender:(id)sender{
//    UIViewController *target = [self targetViewControllerForAction:@selector(mms_showDetailDetailViewController:sender:) sender:sender];
//    if (target) {
//        [target mms_showDetailDetailViewController:vc sender:sender];
//    }
//}
//
//- (id)mms_detailDetailItem{
//    return nil;
//}
//
//- (BOOL)mms_canSelectDetailDetailItem:(id)object{
//    return NO;
//}

//- (id)mms_currentVisibleDetailItemWithSender:(id)sender
//{
//    // Look for a view controller that has a visible photo
//    UIViewController *target = [self targetViewControllerForAction:@selector(mms_currentVisibleDetailItemWithSender:) sender:sender];
//    if (target) {
//        return [target mms_currentVisibleDetailItemWithSender:sender];
//    } else {
//        return nil;
//    }
//}

//- (UINavigationController *)mms_masterNavigationController{
//    return nil;
//}

- (UIViewController *)mms_currentVisibleDetailViewControllerWithSender:(id)sender{
    UIViewController *target = [self targetViewControllerForAction:@selector(mms_currentVisibleDetailViewControllerWithSender:) sender:sender];
    if (target) {
        return [target mms_currentVisibleDetailViewControllerWithSender:sender];
    } else {
        return nil;
    }
}

@end


@implementation UINavigationController (MMSDetailItem)

- (BOOL)mms_containsDetailItem:(id)object{
    return [self.topViewController mms_containsDetailItem:object];
}

- (id)mms_containedDetailItem{
//    if([self.topViewController isKindOfClass:UINavigationController.class]){
//        return self.topViewController.mms_containedDetailItem;
//    }
//    else{
    return self.viewControllers.firstObject.mms_containedDetailItem; // e.g. end nav controller's end VC's item.
   // }
}


//- (BOOL)mms_canSelectDetailDetailItem:(id)object{
//    return [self.topViewController mms_canSelectDetailDetailItem:object];
//}

//- (id)mms_detailDetailItem{
//    if([self.topViewController isKindOfClass:UINavigationController.class]){
//        return self.topViewController.mms_detailDetailItem;
//    }
//    else{
//        return self.viewControllers.firstObject.mms_detailDetailItem;
//    }
//}   


@end

@implementation UISplitViewController (MMSDetailItem)

//- (UINavigationController *)mms_masterNavigationController{
//    if([self.viewControllers.firstObject isKindOfClass:UINavigationController.class]){
//        return self.viewControllers.firstObject;
//    }
//}


- (UIViewController *)mms_currentVisibleDetailViewControllerWithSender:(id)sender{
    if(self.viewControllers.count < 2){
        return nil;
    }
    return self.viewControllers.lastObject;
}

- (BOOL)mms_containsDetailItem:(id)object{
    return [self.viewControllers.firstObject mms_containsDetailItem:object];
}

//- (id)mms_currentVisibleDetailItem{ // WithSender:(id)sender
    //if (self.collapsed) { // didnt work in 1 to 3 collumn
//    if(self.viewControllers.count == 1){
        // If we're collapsed, find the detail nav controller
      //  UINavigationController *nav = self.viewControllers.firstObject;
//        if([self.topViewController isKindOfClass:UINavigationController.class]){
//            return self.topViewController.mms_containedDetailItem;
//        }
        
//        UINavigationController *senderNav = [sender navigationController];
//        UINavigationController *outermost = senderNav;
//        if(outermost.navigationController){
//            outermost = outermost.navigationController;
//        }
        
        // find the master nav controller
        
  //      return nil;
//    } else {
//        // Otherwise, return our detail controller's contained photo (if any)
//        UINavigationController *nc = self.viewControllers.lastObject;
//        UIViewController *controller = nc.viewControllers.firstObject;
//        return controller.mms_containedDetailItem;
//    }
//}

//- (UIBarButtonItem *)mms_currentDisplayModeButtonItemWithSender:(id)sender{
//    return self.displayModeButtonItem;
//}

//- (id)mms_containedDetailItem{
//    return self.viewControllers.firstObject.mms_containedDetailItem;
//}

//- (id)mms_detailDetailItem{
//    return self.viewControllers.firstObject.mms_detailDetailItem;
//}

@end
