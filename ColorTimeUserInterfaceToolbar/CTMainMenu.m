//
//  CTMainMenu.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/15/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTMainMenu.h"

@implementation CTMainMenu{
	
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
	 
	 NSArray *buttons = [NSArray arrayWithObjects:
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"On" style:UIBarButtonItemStylePlain target:self action:@selector(onToolbar:)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onToolbar:)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"ColorTime" style:UIBarButtonItemStylePlain target:self action:@selector(onToolbar:)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"Presets" style:UIBarButtonItemStylePlain target:self action:@selector(onToolbar:)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"Select" style:UIBarButtonItemStylePlain target:self action:@selector(onToolbar:)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],nil
						  ];
	[self setItems: buttons animated:NO];
	
	NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
	
	[nc addObserver:self selector:@selector(notifiactionReceivedOn:) name:@"MainMenuOnSelectedNotification" object:nil];
	[nc addObserver:self selector:@selector(notifiactionReceivedEdit:) name:@"MainMenuEditSelectedNotification" object:nil];
	[nc addObserver:self selector:@selector(notifiactionReceivedColorTime:) name:@"MainMenuColorTimeSelectedNotification" object:nil];
	[nc addObserver:self selector:@selector(notifiactionReceivedPresets:) name:@"MainMenuPresetsSelectedNotification" object:nil];
	[nc addObserver:self selector:@selector(notifiactionReceivedSelect:) name:@"MainMenuSelectSelectedNotification" object:nil];
}

-(void)notifiactionReceivedOn:(id)sender{
	NSLog(@"Received On");
	[self.onAndOffMenu setHidden:!self.onAndOffMenu.isHidden];
	[self.editMenu setHidden:true];
	[self.colorTimeMenu setHidden:true];
	[self.presetMenu setHidden:true];
	//[self.selectMenu setHidden:true];
	[self repositionSelectMenuBasedOnMenuState];
}

-(void)notifiactionReceivedEdit:(id)sender{
	NSLog(@"Received Edit");
	[self.onAndOffMenu setHidden:true];
	[self.editMenu setHidden:!self.editMenu.isHidden];
	[self.colorTimeMenu setHidden:true];
	[self.presetMenu setHidden:true];
	//[self.selectMenu setHidden:true];
	[self repositionSelectMenuBasedOnMenuState];
}

-(void)notifiactionReceivedColorTime:(id)sender{
	NSLog(@"Received ColorTime");
	[self.onAndOffMenu setHidden:true];
	[self.editMenu setHidden:true];
	[self.colorTimeMenu setHidden:!self.colorTimeMenu    .isHidden];
	[self.presetMenu setHidden:true];
	//[self.selectMenu setHidden:true];
	[self repositionSelectMenuBasedOnMenuState];
}

-(void)notifiactionReceivedPresets:(id)sender{
	NSLog(@"Received Presets");
	[self.onAndOffMenu setHidden:true];
	[self.editMenu setHidden:true];
	[self.colorTimeMenu setHidden:true];
	[self.presetMenu setHidden:!self.presetMenu.isHidden];
	//[self.selectMenu setHidden:true];
	[self repositionSelectMenuBasedOnMenuState];
}

-(void)notifiactionReceivedSelect:(id)sender{
	NSLog(@"Received Select");
	
	[self.selectMenu setHidden:!self.selectMenu.isHidden];
	[self repositionSelectMenuBasedOnMenuState];
}

-(void)repositionSelectMenuBasedOnMenuState{
	
	[UIView animateWithDuration:0.2 animations:^(void){		
		BOOL isAnyViewVisible = !self.onAndOffMenu.hidden || !self.editMenu.hidden || !self.colorTimeMenu.hidden || !self.presetMenu.hidden;
		if(isAnyViewVisible){
			self.selectMenu.frame = CGRectMake(self.onAndOffMenu.frame.origin.x,
											   self.onAndOffMenu.frame.origin.y -self.onAndOffMenu.frame.size.height,
											   self.selectMenu.frame.size.width,
											   self.selectMenu.frame.size.height);
		}
		else {
			self.selectMenu.frame = CGRectMake(self.onAndOffMenu.frame.origin.x,
											   self.onAndOffMenu.frame.origin.y,
											   self.selectMenu.frame.size.width,
											   self.selectMenu.frame.size.height);
			
		}
	}];
}


-(void)onToolbar:(UIBarButtonItem*) sender{
	if([sender.title isEqualToString:@"On"])
	{
		[[NSNotificationCenter defaultCenter]
		 postNotificationName:@"MainMenuOnSelectedNotification"
		 object:sender];
	}
	else if([sender.title isEqualToString:@"Edit"]){
		
		[[NSNotificationCenter defaultCenter]
		 postNotificationName:@"MainMenuEditSelectedNotification"
		 object:sender];
	}
	else if([sender.title isEqualToString:@"ColorTime"]){
		
		[[NSNotificationCenter defaultCenter]
		 postNotificationName:@"MainMenuColorTimeSelectedNotification"
		 object:sender];
	}
	else if([sender.title isEqualToString:@"Presets"]){
		
		[[NSNotificationCenter defaultCenter]
		 postNotificationName:@"MainMenuPresetsSelectedNotification"
		 object:sender];
	}
	else if([sender.title isEqualToString:@"Select"]){
		
		[[NSNotificationCenter defaultCenter]
		 postNotificationName:@"MainMenuSelectSelectedNotification"
		 object:sender];
	}
	
	
}

@end
