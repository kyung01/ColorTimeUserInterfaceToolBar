//
//  CTColorTimeMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/17/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTColorTimeMenu.h"

@implementation CTColorTimeMenu{
	
}


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
	
	[segmentedControl insertSegmentWithTitle:@"Shadow" atIndex:0 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Midtones" atIndex:1 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Highlights" atIndex:2 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Contrast" atIndex:3 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Saturation" atIndex:4 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Crop" atIndex:5 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Modulation" atIndex:6 animated:true];
	
	[self layoutIfNeeded];
	if(segmentedControl.frame.size.width > self.frame.size.width)
		self.contentSize = CGSizeMake(segmentedControl.frame.size.width, 0);
	
}
-(void)onSegmentedControl:(UISegmentedControl*) sender{
	NSInteger selectedSegment = sender.selectedSegmentIndex;
	switch (selectedSegment) {
		case 0:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnShadowSelectedNotification"
			 object:sender];
			break;
		case 1:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnMidtonesSelectedNotification"
			 object:sender];
			break;
		case 2:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnHighlightsSelectedNotification"
			 object:sender];
			break;
		case 3:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnContrastSelectedNotification"
			 object:sender];
			break;
		case 4:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnSaturationSelectedNotification"
			 object:sender];
			break;
		case 5:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnCropSelectedNotification"
			 object:sender];
			break;
		case 6:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"OnModulationSelectedNotification"
			 object:sender];
			break;
		default:
			break;
	}
}
@end
