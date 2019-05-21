//
//  CTColorTimeMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/17/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTColorTimeMenu.h"

@implementation CTColorTimeMenu{
	UISegmentedControl *segmentedControl;
	NSLayoutConstraint *segmentedControlLeadingConstraint;
	NSLayoutConstraint *segmentedControlTrailingConstraint;
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
- (void)dealloc
{
	NSLog(@"dealloc");
	[self removeObserver:segmentedControl forKeyPath:@"center"];
}

- (void)willChangeValueForKey:(NSString *)key{
}

- (void)didChangeValueForKey:(NSString *)key{
	NSLog(@"didChangeValueForKey %@ %f %f",key,segmentedControl.frame.size.width, segmentedControl.frame.size.height);
	
	
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
	//Obtain current device orientation
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
	[self layoutSegmentedControl];
	
	[self animateScrollViewForSelectedSegmentAtIndex:(int)segmentedControl.selectedSegmentIndex];
	
	//Do my thing
}

-(void)initMe{
	float minimumSpaceFromEachSide = self.frame.size.width * 0.5;
	[[NSNotificationCenter defaultCenter] addObserver: self selector:   @selector(deviceOrientationDidChange:) name: UIDeviceOrientationDidChangeNotification object: nil];
	
//	[[NSNotificationCenter defaultCenter] addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
//	[[NSNotificationCenter defaultCenter] addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
	
	segmentedControl = [UISegmentedControl new];
	[segmentedControl addTarget:self action:@selector(onSegmentedControl:) forControlEvents:UIControlEventValueChanged ];
	segmentedControl.translatesAutoresizingMaskIntoConstraints = false;
	[self addSubview:segmentedControl];
	
	//Constraint Settings
	[segmentedControl.centerYAnchor		constraintEqualToAnchor: self.centerYAnchor ].active						= true;
	[segmentedControl.widthAnchor		constraintGreaterThanOrEqualToAnchor:self.widthAnchor multiplier:1].active	= true;
	[segmentedControl.heightAnchor		constraintEqualToAnchor:self.heightAnchor multiplier:1 constant:-10].active	= true;
	segmentedControlLeadingConstraint	= [segmentedControl.leadingAnchor
										 constraintEqualToAnchor:self.leadingAnchor constant:minimumSpaceFromEachSide];
	segmentedControlTrailingConstraint	= [segmentedControl.trailingAnchor
										  constraintEqualToAnchor:self.trailingAnchor constant:-minimumSpaceFromEachSide];
	segmentedControlLeadingConstraint.active	= true;
	segmentedControlTrailingConstraint.active	= true;
	
	[segmentedControl insertSegmentWithTitle:@"Shadow" atIndex:0 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Midtones" atIndex:1 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Highlights" atIndex:2 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Contrast" atIndex:3 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Saturation" atIndex:4 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Crop" atIndex:5 animated:true];
	[segmentedControl insertSegmentWithTitle:@"Modulation" atIndex:6 animated:true];
	
	[self layoutIfNeeded];
}

-(void)layoutSegmentedControl{
	segmentedControlLeadingConstraint.constant = self.frame.size.width*0.5;
	segmentedControlTrailingConstraint.constant = -self.frame.size.width*0.5;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	//I can't do VKO method for some reason
	//This method is dead for now but if maybe later figure out why I can't use this VKO
	//NSLog(@"observeValueForKeyPath");
	if (object == segmentedControl && [keyPath isEqualToString: @"frame"]){
		NSLog(@"observeValueForKeyPath IF");
	} else {
		NSLog(@"observeValueForKeyPath ELSE");
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}

-(void)onSegmentedControl:(UISegmentedControl*) sender{
	NSInteger selectedSegment = sender.selectedSegmentIndex;
	NSLog(@"%f %f" , self.center.x, self.center.y);
	[self animateScrollViewForSelectedSegmentAtIndex:(int)selectedSegment];
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

-(void)animateScrollViewForSelectedSegmentAtIndex:(int)segmentIndex{
	CGFloat segmentWidth = segmentedControl.frame.size.width / segmentedControl.numberOfSegments;
	[UIView animateWithDuration:0.5 animations:^{
		[self setContentOffset:CGPointMake(segmentWidth*segmentIndex + segmentWidth*0.5, 0)];
		
	} completion:^(BOOL finished) {
		//some code
	}];
	
}

@end
