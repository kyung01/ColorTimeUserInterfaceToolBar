//
//  CTSelectMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/17/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTSelectMenu.h"

@implementation CTSelectMenu


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
	self.tintColor = UIColor.whiteColor;
	self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
	UISegmentedControl* segmentedControl = [UISegmentedControl new];
	[segmentedControl addTarget:self action:@selector(onSegmentedControl:) forControlEvents:UIControlEventValueChanged ];
	
	segmentedControl.translatesAutoresizingMaskIntoConstraints = false;
	[self addSubview:segmentedControl];
	[[segmentedControl.centerYAnchor constraintEqualToAnchor: self.centerYAnchor] setActive: true ];
	[segmentedControl.widthAnchor constraintGreaterThanOrEqualToAnchor:self.widthAnchor multiplier:1].active = true;
	[segmentedControl.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:1 constant:-10].active = true;
	
	[segmentedControl insertSegmentWithTitle:@"Exit" atIndex:0 animated:true];
	[segmentedControl insertSegmentWithTitle:@"All" atIndex:1 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Outside" atIndex:2 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Inside" atIndex:3 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Brush" atIndex:4 animated:true];
	[segmentedControl insertSegmentWithTitle:@"View Invert" atIndex:5 animated:true];
	
	[self layoutIfNeeded];
	if(segmentedControl.frame.size.width > self.frame.size.width)
		self.contentSize = CGSizeMake(segmentedControl.frame.size.width, 0);
	
}

-(void)onSegmentedControl:(UISegmentedControl*) sender{
	NSInteger selectedSegment = sender.selectedSegmentIndex;
	switch (selectedSegment) {
		case 0:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnExitSelectedNotification"
			 object:sender];
			break;
		case 1:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnAllSelectedNotification"
			 object:sender];
			break;
		case 2:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnOutsideSelectedNotification"
			 object:sender];
			break;
		case 3:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnInsideSelectedNotification"
			 object:sender];
			break;
		case 4:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnBrushSelectedNotification"
			 object:sender];
			break;
		case 5:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnViewInvertSelectedNotification"
			 object:sender];
			break;
			
		default:
			break;
	}
}
@end
