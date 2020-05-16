//
//  MMSFetchedPageViewControllerDelegate.h
//  MMShared
//
//  Created by Malcolm Hall on 18/04/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSFetchedPageViewControllerDelegate2 : NSObject <UIPageViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) id selectedPageObject;

@end

NS_ASSUME_NONNULL_END
