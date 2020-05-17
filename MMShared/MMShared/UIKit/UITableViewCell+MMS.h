//
//  UITableViewCell+MMS.h
//  MMShared
//
//  Created by Malcolm Hall on 19/01/2018.
//  Copyright © 2018 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

extern const UITableViewCellStyle MMSTableViewCellStyleEditable1;

@interface UITableViewCell (MMS)

// the tableView this cell is in, it is used by the text field to call the end editing delegate method.
@property (nonatomic, weak, readonly) UITableView *mms_tableView;

@property (nonatomic, strong, readonly) UITextField *mms_editableTextField;

@end

NS_ASSUME_NONNULL_END
