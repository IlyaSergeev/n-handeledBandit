//
//  TesterController.m
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "TesterController.h"


@implementation TesterController

@synthesize judge;

-(id)init
{
	self = [super init];
	if (self != nil)
	{
		strategy = nil;
		judge = [Judge new];
	}
	return self;
}

-(void)dealloc
{
	[strategy release];
	[judge release];
	[super dealloc];
}

-(void) setStrategy:(BaseStrategyController*)newStrategy
{
	[strategy release];
	strategy = [newStrategy retain];
	[judge setStrategy:[strategy strategy]];
}

-(void)makeTestsCount:(int)testsCount 
		   handsCount:(int)handsCount 
	  recreationCount:(int)recreationCount
{
	if ([strategy isActive])
	{
		[judge clear];
		[judge setStrategy: [strategy strategy]];
		[judge makeNTests:recreationCount games:testsCount hands:handsCount];
	}
}

-(void)drawPath:(NSBezierPath*)path
{
	[[strategy color] set];
	[NSBezierPath setDefaultLineWidth:1];
	[path stroke];
}

-(void)drawInRect:(NSRect)bounds
{
	if ([strategy isActive])
	{
		[self drawPath:[judge besierPath:bounds]];
	}	
}

@end
