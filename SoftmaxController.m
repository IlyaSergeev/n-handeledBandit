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
	if (![super init]) return nil;
	[strategy release];
	strategy = [[SoftmaxStrategy alloc] init];
	[(SoftmaxStrategy*)strategy setTemperature:1];
	[self setColor:[NSColor orangeColor]];
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
	[super NSlog:self];
	NSLog(@"temperature=%F", [self temperature]);
}

@end
