//
//  UIImage+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 14/02/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MMS)

+ (UIImage *)mms_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
