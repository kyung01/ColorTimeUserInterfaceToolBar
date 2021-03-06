//
//  CTColorTimeMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/17/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTColorTimeMenu.h"

@implementation CTColorTimeMenu{
	UIDeviceOrientation previousOrientation;
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
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(bool)isOrientation:(UIDeviceOrientation)orientaiton sameOrientationAs:(UIDeviceOrientation)otherOrientation{
	
	bool isOrientationLandscape = UIDeviceOrientationIsLandscape(orientaiton);
	bool isOtherOrientationLandsapce = UIDeviceOrientationIsLandscape(otherOrientation);
	return isOrientationLandscape == isOtherOrientationLandsapce;
}
- (void)deviceOrientationDidChange:(NSNotification *)notification {
	
	//Obtain current device orientation
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation]; //use the orientation if needed
	if(orientation == UIDeviceOrientationUnknown){
		return;
	}
	if(! [self isOrientation:orientation sameOrientationAs:previousOrientation] ){
		//new orientation detected
		NSLog(@"deviceOrientationDidChange");
		previousOrientation = orientation;
		[self layoutSegmentedControl];
		[self animateScrollViewForSegmentedControler];
	}
	//orientation
	
}

-(float) getSegmnetedControlIndentFromEachSide{
	return self.frame.size.width * 0.5;
}

-(void)initMe{
	self.tintColor = UIColor.whiteColor;
	self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
	[[NSNotificationCenter defaultCenter] addObserver: self selector:   @selector(deviceOrientationDidChange:) name: UIDeviceOrientationDidChangeNotification object: nil];
	[self initSegmentedControlWithIndentOf:[self getSegmnetedControlIndentFromEachSide]];
	[self layoutIfNeeded];
}
- (void)setHidden:(BOOL)hidden{
	[super setHidden:hidden];
	if(!hidden){
		[self animateScrollViewForSegmentedControler];
	}
	
}

-(void) initSegmentedControlWithIndentOf:(float)minimumSpaceFromEachSide{
	
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
	
}

-(void)layoutSegmentedControl{
	segmentedControlLeadingConstraint.constant = self.frame.size.width*0.5;
	segmentedControlTrailingConstraint.constant = -self.frame.size.width*0.5;
}

//VKO pattern model is unused because I can't get it work
//Simpler if I just try to detect the orientation for now
//Do implement it later to support application resizing functionality
/*
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
 */

-(void)onSegmentedControl:(UISegmentedControl*) sender{
	NSInteger selectedSegment = sender.selectedSegmentIndex;
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
-(void)animateScrollViewForSegmentedControler{
	if(segmentedControl.selectedSegmentIndex != -1)
		[self animateScrollViewForSelectedSegmentAtIndex:(int)segmentedControl.selectedSegmentIndex];
	else{
		CGFloat segmentWidth = segmentedControl.frame.size.width / segmentedControl.numberOfSegments;
		[self setContentOffset: CGPointMake(segmentWidth*0.5 , 0) animated:true];
		
	}
}
-(void)animateScrollViewForSelectedSegmentAtIndex:(int)segmentIndex{
	CGFloat segmentWidth = segmentedControl.frame.size.width / segmentedControl.numberOfSegments;
	
	[self setContentOffset:CGPointMake(segmentWidth*segmentIndex + segmentWidth*0.5, 0) animated:YES];
	
	
}

@end
