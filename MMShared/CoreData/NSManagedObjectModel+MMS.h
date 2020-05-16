//
//  NSManagedObjectModel+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObjectModel (MMS)

// merged model of all models in bundle.
@property (class, readonly, strong) NSManagedObjectModel *mms_defaultModel;

// Easily load a model from a model file and caches it. Do not include any file extension.
+ (NSManagedObjectModel *)mms_modelNamed:(NSString *)name;

// Returns the entity in the model without copying it which is what entityByName does, this allows it to be mutated.
- (NSEntityDescription *)mms_entityNamed:(NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

