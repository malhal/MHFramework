//
//  UINavigationItem+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 10/04/2015.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "UINavigationItem+MMS.h"
#import <objc/runtime.h>

@implementation UINavigationItem (TitleRefresh)

- (UIView*)mms_getTitleRefreshView{

    UIView* titleRefreshView = objc_getAssociatedObject(self, @selector(mms_getTitleRefreshView));
    
    if(!titleRefreshView){
        // create a default
        static UIActivityIndicatorView* kDefault = nil;
        if(!kDefault){
            kDefault = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            [kDefault startAnimating];
        }
        // return the default
        return kDefault;
    }
    
    return titleRefreshView;
}

- (void)mms_setTitleRefreshView:(UIView *)titleRefreshView {
    [self willChangeValueForKey:@"titleRefreshView"];
    objc_setAssociatedObject(self, @selector(mms_getTitleRefreshView),
                             titleRefreshView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"titleRefreshView"];
}

- (NSInteger)mms_getBeginTitleRefreshingCount{
    NSNumber* number = objc_getAssociatedObject(self, @selector(mms_getBeginTitleRefreshingCount));
    return number.integerValue;
}

- (void)mms_setBeginTitleRefreshingCount:(NSInteger)count{
    objc_setAssociatedObject(self, @selector(mms_getBeginTitleRefreshingCount),
                             [NSNumber numberWithInteger:count],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)mms_beginTitleRefreshing{
    
    NSInteger count = [self mms_getBeginTitleRefreshingCount];
    count++;
    [self mms_setBeginTitleRefreshingCount:count];
    
    self.titleView = [self mms_getTitleRefreshView];
}

- (void)mms_endTitleRefreshing{
    [self mms_endTitleRefreshingResetCounter:NO];
}

- (void)mms_endTitleRefreshingResetCounter:(BOOL)resetCounter{
    self.titleView = nil;
    
//    NSInteger count = [self mms_getBeginTitleRefreshingCount];
//    count--;
//    
//    if(resetCounter){
//        count = 0;
//    }
//    [self mms_setBeginTitleRefreshingCount:count];
//    
//    // The assertion helps to find programmer errors in activity indicator management.
//    // Since a negative NumberOfCallsToSetVisible is not a fatal error,
//    // it should probably be removed from production code.
//    NSAssert(count >= 0, @"mms_endTitleRefreshing was called more often than begin");
//    
//    // hide if our count is zero
//    if(count <= 0){
//        self.titleView = nil;
//    }
}

@end
