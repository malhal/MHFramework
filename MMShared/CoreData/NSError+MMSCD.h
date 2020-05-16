//
//  NSError+MMSCD.h
//  MMShared
//
//  Created by Malcolm Hall on 12/09/2016.
//  Copyright © 2016 Malcolm Hall. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <MMShared/MMSDefines.h>

@interface NSError (MMSCD)

@property (strong, nonatomic, readonly) NSDictionary *mms_validationDescriptionsByEntityName;

// shows validation errors as messages, otherwise defaults to localizedDescription.
@property (strong, nonatomic, readonly) NSString *mms_readableDescription;

@property (assign, nonatomic, readonly) BOOL mms_isValidationError;

@property (assign, nonatomic, readonly) BOOL mms_isConstraintMergeError;

@end
