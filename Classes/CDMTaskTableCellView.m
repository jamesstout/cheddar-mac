//
//  CDMTaskTableCellView.m
//  Cheddar for Mac
//
//  Created by Sam Soffes on 8/3/12.
//  Copyright (c) 2012 Nothing Magical. All rights reserved.
//

#import "CDMTaskTableCellView.h"
#import "CDKTask+CDMAdditions.h"

@implementation CDMTaskTableCellView

- (void)awakeFromNib {
	[super awakeFromNib];
    [self addObserver:self forKeyPath:@"objectValue.displayText" options:0 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CDKTask *task = [self objectValue];
    [self.textField setAttributedStringValue:[task attributedDisplayText]];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"objectValue.displayText"];
}
@end
