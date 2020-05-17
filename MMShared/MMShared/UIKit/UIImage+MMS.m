//
//  UIImage+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 14/02/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import "UIImage+MMS.h"

@implementation UIImage (MMS)

// todo watch check
+ (UIImage *)mms_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle{
    UITraitCollection *tc;
    // if(!UIDevice.mms_isWatchCompanion && !UIDevice.mms_isWatch)
    tc = UIScreen.mainScreen.traitCollection;
    return [self imageNamed:name inBundle:bundle compatibleWithTraitCollection:tc];
}

@end

