//
//  TableDataSource.h
//  ScrollPosition
//
//  Created by Malcolm Hall on 09/04/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMSTableViewControllerDataDelegate<NSObject>

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object;

@end

@protocol MMSTableViewControllerData<UITableViewDataSource>

- (instancetype)initWithTableViewController:(UITableViewController<MMSTableViewControllerDataDelegate> *)tableViewController;

@property (weak, nonatomic) UITableViewController<MMSTableViewControllerDataDelegate> *tableViewController;

@end

NS_ASSUME_NONNULL_END
