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
						 [[UIBarButtonItem alloc] initWithTitle:@"On" style:UIBarButtonItemStylePlain target:nil action:@selector(bttn00)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:nil action:@selector(bttn00)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"ColorTime" style:UIBarButtonItemStylePlain target:nil action:@selector(bttn00)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"Presets" style:UIBarButtonItemStylePlain target:nil action:@selector(bttn00)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
						 [[UIBarButtonItem alloc] initWithTitle:@"Select" style:UIBarButtonItemStylePlain target:nil action:@selector(bttn00)],
						 [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]
						  ];
	 [self setItems: buttons animated:NO];
}
-(void)d
{
}

@end
