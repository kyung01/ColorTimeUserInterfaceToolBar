//
//  CTOnOffMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/15/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTOnOffMenu.h"

@implementation CTOnOffMenu

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initMe];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self initMe];
	}
	return self;
}

-(void)initMe{
	UISegmentedControl* segmentedControl = [UISegmentedControl new];
	[segmentedControl addTarget:self action:@selector(onSegmentedControl:) forControlEvents:UIControlEventValueChanged ];
	
	segmentedControl.translatesAutoresizingMaskIntoConstraints = false;
	[self addSubview:segmentedControl];
	[[segmentedControl.centerYAnchor constraintEqualToAnchor: self.centerYAnchor] setActive: true ];
	[segmentedControl.widthAnchor constraintGreaterThanOrEqualToAnchor:self.widthAnchor multiplier:1].active = true;
	[segmentedControl.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:1 constant:-10].active = true;
	
	[segmentedControl insertSegmentWithTitle:@"On" atIndex:0 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Off" atIndex:1 animated:true];
	
	[self layoutIfNeeded];
	if(segmentedControl.frame.size.width > self.frame.size.width)
		self.contentSize = CGSizeMake(segmentedControl.frame.size.width, 0);	
}

-(void)onSegmentedControl:(UISegmentedControl*) sender{
	NSInteger selectedSegment = sender.selectedSegmentIndex;
	switch (selectedSegment) {
		case 0:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnSelectedNotification"
			 object:sender];
			break;
		case 1:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OffSelectedNotification"
			 object:sender];
			break;
			
		default:
			break;
	}
}
@end
