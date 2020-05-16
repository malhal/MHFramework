//
//  MMSCompletionStoryboardSegue.h
//  MMShared
//
//  Created by Malcolm Hall on 20/09/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMSCompletionStoryboardSegue : UIStoryboardSegue

@property (nonatomic, copy) void(^completion)(void);

@end

NS_ASSUME_NONNULL_END
