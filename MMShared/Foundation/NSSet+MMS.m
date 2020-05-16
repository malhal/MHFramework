//
//  NSSet+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 04/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSSet+MMS.h"

@implementation NSSet (MMS)

- (BOOL)mms_containsObjectPassingTest:(BOOL (NS_NOESCAPE ^)(id obj, BOOL *stop))predicate{
    return [self mms_objectPassingTest:predicate];
}

- (id)mms_objectPassingTest:(BOOL (NS_NOESCAPE ^)(id obj, BOOL *stop))predicate{
    return [self objectsPassingTest:predicate].anyObject;
}

- (NSSet *)mms_objectsOfClass:(Class)aClass{
    return [self objectsPassingTest:^BOOL(id _Nonnull obj, BOOL * _Nonnull stop) {
        return [obj isKindOfClass:aClass];
    }];
}

@end
