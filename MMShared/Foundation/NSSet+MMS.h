//
//  NSSet+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 18/09/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MMShared/MMSDefines.h>

@interface NSSet<__covariant ObjectType>  (MMS)

- (BOOL)mms_containsObjectPassingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, BOOL *stop))predicate;

- (ObjectType)mms_objectPassingTest:(BOOL (NS_NOESCAPE ^)(ObjectType obj, BOOL *stop))predicate;

- (NSSet<ObjectType> *)mms_objectsOfClass:(Class)aClass;

@end
