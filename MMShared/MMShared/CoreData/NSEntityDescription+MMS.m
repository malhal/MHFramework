//
//  NSEntityDescription+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import "NSEntityDescription+MMS.h"

@implementation NSEntityDescription (MMS)

- (NSDictionary<NSString *, NSRelationshipDescription *> *)mms_toManyRelationshipsByName{
    NSArray *toManyRelationships = self.mms_toManyRelationships;
    return [NSDictionary dictionaryWithObjects:toManyRelationships forKeys:[toManyRelationships valueForKey:@"name"]];
}

- (NSDictionary<NSString *, NSRelationshipDescription *> *)mms_toOneRelationshipsByName{
    NSArray *toOneRelationships = self.mms_toOneRelationships;
    return [NSDictionary dictionaryWithObjects:toOneRelationships forKeys:[toOneRelationships valueForKey:@"name"]];
}

- (NSArray<NSRelationshipDescription *> *)mms_relationshipsWithManagedObjectClass:(Class)managedObjectClass{
    return [self.relationshipsByName.allValues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"managedObjectClass = %@", managedObjectClass]];
}

- (NSArray *)mms_toManyRelationships{
    return [self.relationshipsByName.allValues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isToMany = YES"]];
}

- (NSArray *)mms_toOneRelationships{
    return [self.relationshipsByName.allValues filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isToMany = NO"]];
}

- (NSArray *)mms_transientProperties{
    return [self.properties filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.isTransient = true"]];
}

- (NSString *)mms_propertyNameForToManyRelation{
    return [[self.name stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                               withString:[self.name substringToIndex:1].lowercaseString] stringByAppendingString:@"s"];
}

@end
