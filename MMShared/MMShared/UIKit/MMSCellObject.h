//
//  MMSCellObject.h
//  MMShared
//
//  Created by Malcolm Hall on 21/05/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MMSCellObject <NSObject>
@required
@property (copy, nonatomic, readonly) NSString *title;

@optional
@property (copy, nonatomic, readonly) NSString *subtitle;

@end

NS_ASSUME_NONNULL_END
