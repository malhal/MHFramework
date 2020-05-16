//
//  UITableViewController+MMS.m
//  MMShared
//
//  Created by Malcolm Hall on 11/02/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import "UITableViewController+MMS.h"
#import "MMSUtilities.h"

@implementation UITableViewController (MMS)

- (UITableView *)mms_tableViewIfLoaded{
    return MMSDynamicCast(UITableView.class, self.viewIfLoaded);
}

@end
