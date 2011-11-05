//
//  SoftmaxController.m
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "SoftmaxController.h"


@implementation SoftmaxController


-(id)init
{
	self = [super init];
	if (self != nil)
	{
		strategy = [[SoftmaxStrategy alloc] init];
		[(SoftmaxStrategy*)strategy setTemperature:1];
		[self setColor:[NSColor orangeColor]];
	}
	return self;
}


-(double)temperature
{
	return [(SoftmaxStrategy*)strategy temperature];
}

-(void)setTemperature:(double)newTemperature
{
	[(SoftmaxStrategy*)strategy setTemperature:newTemperature];
}

-(IBAction)NSLog:(id)sender
{
	[super NSLog:self];
	NSLog(@"temperature=%f", [self temperature]);
}

@end
