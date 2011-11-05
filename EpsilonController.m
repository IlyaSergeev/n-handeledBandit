//
//  EpsilonController.m
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "EpsilonController.h"


@implementation EpsilonController


-(id)init
{
	self = [super init];
	if (self != nil)
	{
		strategy = [[EpsilonStrategy alloc] init];
		[self setColor:[NSColor blueColor]];
	}
	return self;
}

-(int)N
{
	return [(EpsilonStrategy*)strategy N];
}

-(void)setN:(int)newN
{
	[(EpsilonStrategy*)strategy setN:newN];
}

-(double)epsilon
{
	return [(EpsilonStrategy*)strategy epsilon];
}

-(void)setEpsilon:(double)newEpsilon
{
	[(EpsilonStrategy*)strategy setEpsilon:newEpsilon];
}

-(IBAction)NSLog:(id)sender
{
	[super NSLog:sender];
	NSLog(@"N=%d, epsilon=%F", [self N], [self epsilon]);
}

@end
