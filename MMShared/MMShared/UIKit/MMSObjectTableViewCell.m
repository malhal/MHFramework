//
//  MMSObjectTableViewCell.m
//  MMShared
//
//  Created by Malcolm Hall on 21/05/2020.
//  Copyright © 2020 Malcolm Hall. All rights reserved.
//

#import "MMSObjectTableViewCell.h"

static void * const kMMSObjectTableViewCellKVOContext = (void *)&kMMSObjectTableViewCellKVOContext;

@interface MMSObjectTableViewCell()

@property (assign, nonatomic) BOOL needsToUpdateViews;

@end

@implementation MMSObjectTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    _needsToUpdateViews = YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellObject:(id<MMSCellObject>)cellObject{
    if(cellObject == _cellObject){
        return;
    }
    else if(_cellObject){
        [self removeCellObjectObservers];
    }
    MMSProtocolAssert(cellObject, @protocol(MMSCellObject));
    _cellObject = cellObject;
    if(cellObject){
        [self addCellObjectObservers];
        [self updateViewsForCurrentFolderIfNecessary];
    }
}

- (void)addCellObjectObservers{
    // can't addObserver to id
    [self.cellObject addObserver:self forKeyPath:@"title" options:0 context:kMMSObjectTableViewCellKVOContext];
    // ok that its optional
    [self.cellObject addObserver:self forKeyPath:@"subtitle" options:0 context:kMMSObjectTableViewCellKVOContext];
}

- (void)removeCellObjectObservers{
    [self.cellObject removeObserver:self forKeyPath:@"title" context:kMMSObjectTableViewCellKVOContext];
    [self.cellObject removeObserver:self forKeyPath:@"subtitle" context:kMMSObjectTableViewCellKVOContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == kMMSObjectTableViewCellKVOContext) {
        [self updateViewsForCurrentFolderIfNecessary];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)updateViewsForCurrentFolderIfNecessary{
    if(!self.window){
        self.needsToUpdateViews = YES;
        return;
    }
    [self updateViewsForCurrentObject];
}

- (void)updateViewsForCurrentObject{
    self.textLabel.text = self.cellObject.title;
    if([self.cellObject respondsToSelector:@selector(subtitle)]){
        self.detailTextLabel.text = self.cellObject.subtitle;
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    if(newWindow && self.needsToUpdateViews){
        [self updateViewsForCurrentObject];
    }
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.needsToUpdateViews = YES;
}

- (void)dealloc
{
    if(_cellObject){
        [self removeCellObjectObservers];
    }
}

@end
