//
//  UIResponder+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 13/09/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import "UIResponder+MMS.h"
#import "UIBarButtonItem+MMS.h"

@implementation UIResponder (MMS)

- (__kindof UIViewController *)mms_viewController{
    UIResponder *responder = self;
    while (responder && ![responder isKindOfClass:UIViewController.class]){ // from the cell go up the views to the controller.
        responder = [responder nextResponder];
    }
    return (UIViewController *)responder;
}

//- (NSPersistentContainer *)mms_persistentContainer{
//    NSPersistentContainer *result;
//    if (self.nextResponder != nil){
//        if ([self.nextResponder respondsToSelector:@selector(mms_persistentContainer)]){
//            result = self.nextResponder.mms_persistentContainer;
//        }
//    }
//    return result;
//}

@end

