//
//  TableDataSource.h
//  ScrollPosition
//
//  Created by Malcolm Hall on 09/04/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MMShared/MMSTableViewControllerData.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSTableViewControllerDataFetchedImpl : NSObject<MMSTableViewControllerData, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end


NS_ASSUME_NONNULL_END
