//
//  MMSObjectTableViewCell.h
//  MMShared
//
//  Created by Malcolm Hall on 21/05/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//
// Inspired by MKAnnotationView and ICFolderListTableViewCell
// Uses KVO

#import <UIKit/UIKit.h>
#import <MMShared/MMSCellObject.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSObjectTableViewCell : UITableViewCell

@property (strong, nonatomic) NSObject<MMSCellObject> *cellObject;

@end

NS_ASSUME_NONNULL_END
