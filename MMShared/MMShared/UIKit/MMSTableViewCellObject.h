//
//  MCDManagedObjectTableViewCell.h
//  MCoreData
//
//  Created by Malcolm Hall on 27/02/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMSTableViewCellObject <NSObject>

- (NSString *)titleForTableViewCell;
@optional
- (NSString *)subtitleForTableViewCell;

@end

NS_ASSUME_NONNULL_END
