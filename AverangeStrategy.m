//
//  AverangeStrategy.m
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "AverangeStrategy.h"


@implementation AverangeStrategy

#pragma mark -
#pragma mark Properties

@synthesize alpha;

- (void)setHandsCount:(int)theHandsCount
{
	if (theHandsCount != handsCount)
	{
		free(array);
		array = malloc(sizeof(double) * theHandsCount);
		handsCount = theHandsCount;
	}
	[self clear];
}
//
//-(int)handsCount
//{
//	return [super handsCount];
//}
//
//-(void)setDefaultFee:(double)newFee
//{
//	[super setDefaultFee:newFee];
//}
//
//-(double)defaultFee
//{
//	return [super defaultFee];
//}

#pragma mark -
#pragma mark Constructors

-(id)init
{
	if ([super init] == nil) return nil;
	defaultFee = 0.0;
	[self setHandsCount:0];
	[self setAlpha:0.02];
	return self;
}

- (void)dealloc
{
	free(array);
	[super dealloc];
}

-(void)clear
{
	for (int i = 0; i < handsCount; ++i)
	{
		array[i] = defaultFee;
	}
}


#pragma mark -
#pragma mark Strategy interface

-(void)updateFee:(double)theFee toHandle:(int)handNum
{
	array[handNum] = (1 - alpha) * array[handNum] + alpha * theFee;
}

-(int)nextHandle
{
	int max = -1;
	if (handsCount > 0)
	{
		max = rand() % handsCount;
		for (int i = 0; i < handsCount; i++)
		{			
			if (array[max] < array[i])
			{
				max = i;
			}
		}	
	}
	return max;
}

@end
