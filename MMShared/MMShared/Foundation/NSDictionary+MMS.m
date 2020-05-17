//
//  NSDictionary+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 23/01/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import "NSDictionary+MMS.h"
#import "MMSUtilities.h"

@implementation NSDictionary (MMS)

- (NSSet*)mms_allKeysSet{
    return [NSSet setWithArray:self.allKeys];
}

//- (NSArray*)mms_objectsForKnownKeys:(NSArray*)keys{
//    return [self objectsForKeys:keys notFoundMarker:[NSNull null]];
//}

- (NSDictionary *)mms_unflattenDictionary{
    // create the new dict we will fill
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    for(NSString *key in self.allKeys){ // app.name, app.date etc.
        // copy a reference to a variable that we will change as we go through the tree.
        NSMutableDictionary *d2 = d;
        NSArray *parts = [key componentsSeparatedByString:@"."]; //e.g. key1,key2,key3
        NSArray*partsExceptLast = [parts subarrayWithRange:NSMakeRange(0, parts.count - 1)]; // e.g. key1,key2
        for(NSString* part in partsExceptLast){
            NSMutableDictionary *d3 = d2[part];
            if(!d3){
                d3 = [NSMutableDictionary dictionary];
            }
            d2[part] = d3;
            d2 = d3; // change the main dict to this sub dict so we can go deeper.
        }
        d2[parts.lastObject] = self[key]; // set the final value
    }
    return d;
}

 - (instancetype)mms_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary{
     NSMutableDictionary *combinedDictionary = self.mutableCopy;
     [combinedDictionary addEntriesFromDictionary:dictionary];
     return combinedDictionary;
 }

- (id)mms_nilIfNSNullObjectForKey:(id)aKey{
    id obj = [self objectForKey:aKey];
    if(obj == NSNull.null){
        return nil;
    }
    return obj;
}

- (NSString *)mms_prettyDescriptionWithTabLevel:(NSUInteger)level{
    NSMutableString *s = [NSMutableString stringWithString:@"{\n"];
    NSMutableString *tabs = NSMutableString.new;
    for(NSInteger i=0;i<=level;i++){
        [tabs appendString:@"\t"];
    }
    NSString *format = @"%@%@ = %@\n";
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSDictionary *dict = MMSDynamicCast([NSDictionary class], obj);
        if(dict){
            [s appendFormat:format, tabs, key, [dict mms_prettyDescriptionWithTabLevel:level + 1]];
            return;
        }
        [s appendFormat:format, tabs, key, obj];
    }];
    return s;
}

@end
