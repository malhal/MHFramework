//
//  DataSource.h
//  Paging1
//
//  Created by Malcolm Hall on 04/04/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

//@class MMSFetchedPageContainerDataSource;
//
//@protocol MMSFetchedPageContainerDataSourceDelegate<NSObject>
//
//- (UIViewController<MMSPageObjectControlling> *)fetchedPageContainerDataSource:(MMSFetchedPageContainerDataSource *)fetchedPageContainerDataSource newViewControllerWithObject:(id)object;
//
//@end

//@protocol MMSFetchedPage <NSObject>
//
//
//
//@end

@interface MMSFetchedPageContainerDataSource : NSObject<UIPageViewControllerDataSource>

@property (strong, nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)controller;

//@property (weak, nonatomic) id<MMSFetchedPageContainerDataSourceDelegate> delegate;

- (UIViewController *)viewControllerForObject:(id)object inPageViewController:(UIPageViewController *)pageViewController;

@end

@interface UIViewController (MMSFetchedPageContainerDataSource)

@property (strong, nonatomic) id fetchedPageObject;

@end

NS_ASSUME_NONNULL_END
