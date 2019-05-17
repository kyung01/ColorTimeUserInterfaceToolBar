//
//  CTPresetMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/17/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTPresetMenu.h"

@implementation CTPresetMenu


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
	
	[segmentedControl insertSegmentWithTitle:@"Black And White" atIndex:0 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Cross Prcoess" atIndex:1 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Sepia" atIndex:2 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Vignette" atIndex:3 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Soft Vignette" atIndex:4 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Warm" atIndex:5 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Cool" atIndex:6 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Graphic" atIndex:7 animated:true];
	
	[self layoutIfNeeded];
	if(segmentedControl.frame.size.width > self.frame.size.width)
		self.contentSize = CGSizeMake(segmentedControl.frame.size.width, 0);
	
}

-(void)onSegmentedControl:(UISegmentedControl*) sender{
	NSInteger selectedSegment = sender.selectedSegmentIndex;
	switch (selectedSegment) {
		case 0:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"BlackAndWhiteSelectedNotification"
			 object:sender];
			break;
		case 1:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"CrossProcessSelectedNotification"
			 object:sender];
			break;
		case 2:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"SepiaSelectedNotification"
			 object:sender];
			break;
		case 3:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"VignetteSelectedNotification"
			 object:sender];
			break;
		case 4:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"SoftVignetteSelectedNotification"
			 object:sender];
			break;
		case 5:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"WarmSelectedNotification"
			 object:sender];
			break;
		case 6:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"CoolSelectedNotification"
			 object:sender];
			break;
		case 7:
			[[NSNotificationCenter defaultCenter]
			 postNotificationName:@"GraphicSelectedNotification"
			 object:sender];
			break;
			
		default:
			break;
	}
}

@end
