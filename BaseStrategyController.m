//
//  BaseStrategyController.m
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "BaseStrategyController.h"


@implementation BaseStrategyController

-(id)init
{
	self = [super init];
	if (self != nil)
	{
		strategy = nil;
		[self setIsActive:YES];
	}
	return self;
}

-(void)dealloc
{
	[strategy release];
	[super dealloc];
}

#pragma mark Properties

@synthesize strategy;
@synthesize isActive;
@synthesize color;

-(double)defaultFee
{
	return [strategy defaultFee];
}

-(void)setDefaultFee:(double)newFee
{
	[strategy setDefaultFee:newFee];
}

#pragma mark actions

-(IBAction)NSLog:(id)sender
{
	NSLog(@"isActive=%@ color=%@", isActive?@"YES":@"NO", color);
}

@end
