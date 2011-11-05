//
//  GreedyStragedy.m
//  n-Handeled Bandit
//
//  Created by Илья on 27.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "GreedyStrategy.h"


@implementation GreedyStrategy

#pragma mark -
#pragma mark Properties

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

-(void)setN:(int)N
{
	if (N == 0) 
		alpha = 0;
	else 
		alpha = 1 / (double)N;
}

-(int)N
{
	return alpha==0 ? 0: 1 / alpha;
}

#pragma mark -
#pragma mark Constructors

-(id)init
{
	if ([super init] == nil) return nil;
	defaultFee = 0.0;
	[self setHandsCount:0];
	[self setN:50];
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

-(void)refreshAll
{
	for (int i = 0; i < handsCount; ++i)
	{
		array[i] -= alpha;
	}
}

-(void)updateFee:(double)theFee toHandle:(int)handNum
{
	[self refreshAll];
	array[handNum] = MAX(array[handNum], theFee);
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

