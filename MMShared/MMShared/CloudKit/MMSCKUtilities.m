//
//  MMSUtilities.m
//  MMShared
//
//  Created by Malcolm Hall on 01/10/2017.
//  Copyright © 2017 Malcolm Hall. All rights reserved.
//

#import "MMSCKUtilities.h"

CKDatabaseScope MMSDatabaseScopeFromString(NSString *s){
    if([s isEqualToString:@"Public"]){
        return 1;
    }
    else if([s isEqualToString:@"Private"]){
        return 2;
    }
    else if([s isEqualToString:@"Shared"]){
        return 3;
    }
    else if([s isEqualToString:@"Organization"]){
        return 4;
    }
    else{
        return 0;
    }
}

NSString * MMSDatabaseScopeString(CKDatabaseScope scope){
    NSString *s;
    switch (scope) {
        case 0:
            s = @"UNKNOWN_SCOPE";
            break;
        case 1:
            s = @"Public";
            break;
        case 2:
            s = @"Private";
            break;
        case 3:
            s = @"Shared";
            break;
        case 4:
            s = @"Organization";
            break;
    }
    return s;
}
