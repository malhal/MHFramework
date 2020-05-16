//
//  MMSDefines.h
//  MMShared
//
//  Created by Malcolm Hall on 19/05/2016.
//
//

#ifndef MMS_EXTERN
    #ifdef __cplusplus
        #define MMS_EXTERN   extern "C" __attribute__((visibility ("default")))
    #else
        #define MMS_EXTERN   extern __attribute__((visibility ("default")))
    #endif
#endif

#define MMSThrowMethodUnavailableException()  @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"method unavailable" userInfo:nil];

#define MMSThrowInvalidArgumentExceptionIfNil(argument)  if (!argument) { @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@#argument" cannot be nil." userInfo:nil]; }
