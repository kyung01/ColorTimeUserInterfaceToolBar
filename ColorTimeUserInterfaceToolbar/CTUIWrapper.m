//
//  CTUIWrapper.m
//  ColorTimeUserInterfaceToolbar
//
//  Created by Kyung Chang on 5/21/19.
//  Copyright © 2019 Kyung Chang. All rights reserved.
//

#import "CTUIWrapper.h"

@implementation CTUIWrapper{

	IBOutlet UIView *mainView;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self basicInit];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self basicInit];
	}
	return self;
}

-(void)basicInit{
	[NSBundle.mainBundle loadNibNamed:@"CTUIWrapper" owner:self options:nil];
	[self addSubview:mainView];
	mainView.frame = self.bounds;
	mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
	
}
@end
