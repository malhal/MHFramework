//
//  MMSFetchedPageViewController.h
//  MMShared
//
//  Created by Malcolm Hall on 05/03/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import <MMShared/MMSFetchedPageContainerDataSource.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol MMSFetchedPageViewControllerDelegate;

@interface MMSFetchedPageViewController<ResultType:NSManagedObject *> : UIPageViewController<NSFetchedResultsControllerDelegate>

//@property (strong, nonatomic) UIPageViewController *childPageViewController;
//@property (strong, nonatomic, nullable) NSFetchedResultsController<ResultType> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//@property (strong, nonatomic, nullable) NSFetchRequest<ResultType> *fetchRequest;

//@property (strong, nonatomic) ResultType selectedPageObject;

//@property (weak, nonatomic) id<MMSFetchedPageViewControllerDelegate> delegate;

//@property (strong, nonatomic, readonly) NSArray<ResultType> *fetchedObjects;

//- (void)configureView;
@property (strong, nonatomic) MMSFetchedPageContainerDataSource *fetchedPageContainerDataSource;

@end

@protocol MMSDelegateSelection <NSObject>

//- (void)fetchedViewController:(MMSFetchedPageViewController *)fetchedViewController didDeleteDisplayedObject:(NSManagedObject *)displayedObject;
//
//- (void)fetchedViewController:(MMSFetchedPageViewController *)fetchedViewController didSelectPageObject:(id)object;

- (id)selectedPageObjectInViewController:(UIViewController *)viewController;


@end

NS_ASSUME_NONNULL_END
