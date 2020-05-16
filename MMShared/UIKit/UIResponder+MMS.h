//
//  UIResponder+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 13/09/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (MMS)

- (__kindof UIViewController *)mms_viewController;

//- (__kindof NSPersistentContainer *)mms_persistentContainer;

@end

NS_ASSUME_NONNULL_END
