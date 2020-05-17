//
//  TableView.h
//  CloudEvents
//
//  Created by Malcolm Hall on 11/06/2019.
//  Copyright © 2019 Malcolm Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMShared/MMSDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class MMSTableView, MMSMasterTable;

@protocol MMSTableViewDelegate <UITableViewDelegate>

@optional
- (void)tableViewDidEndEditing:(MMSTableView *)tableView;
- (void)tableViewDidMoveToSuperview:(MMSTableView *)tableView;
//- (void)tableView:(MMSTableView *)tableView willMoveToWindow:(UIWindow *)newWindow;
//- (void)tableViewDidMoveToWindow:(MMSTableView *)tableView;

@end

@interface MMSTableView : UITableView

@property (weak, nonatomic) id<MMSTableViewDelegate> delegate;

@property (strong, nonatomic) MMSMasterTable *masterTable;

@end


NS_ASSUME_NONNULL_END
