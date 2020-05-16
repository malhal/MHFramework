//
//  UISplitViewController+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 08/12/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import "UISplitViewController+MMS.h"
#import <objc/runtime.h>
#import "MMSUtilities.h"

NSString * const MMSSplitViewControllerDidChangeSplitItem = @"MMSSplitViewControllerDidChangeSplitItem";

@interface UISplitViewController (MMS)

@end

@implementation UISplitViewController (MMS)

- (UIViewController *)mms_secondaryViewController{
    NSArray *viewControllers = self.viewControllers;
    if(viewControllers.count != 2){
        return nil;
    }
    return viewControllers[1];
}

- (UINavigationController *)mms_secondaryNavigationController{
    return MMSDynamicCast(UINavigationController.class, self.mms_secondaryViewController);
}

//- (id)mms_detailItem{
//    return objc_getAssociatedObject(self, @selector(mms_detailItem));
//}
//
//- (void)mms_setDetailItem:(id)detailItem {
//    objc_setAssociatedObject(self, @selector(mms_detailItem), detailItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [NSNotificationCenter.defaultCenter postNotificationName:MMSViewControllerDetailItemDidChange object:self userInfo:nil];
//}



@end
