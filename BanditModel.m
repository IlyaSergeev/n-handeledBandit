//
//  BanditModel.m
//  n-Handeled Bandit
//
//  Created by Илья on 25.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "BanditModel.h"


@implementation BanditModel

#pragma mark -
#pragma mark constructors and destructors

-(id)init
{
	self = [super init];
	if (self != nil)
	{
		array = [[NSMutableArray alloc] init];
	}
	return self;
}

-(id)initWith:(int)handsCount
{
	self = [super init];
	if (self != nil)
	{
		[self createBanditWith:handsCount];
	}
	return self;
}

-(void)dealloc
{
	[array removeAllObjects];
	[array release];
	[super dealloc];
}


#pragma mark -
#pragma mark logic

-(void)createBanditWith:(int)nHands
{
	[array removeAllObjects];
	for (int i = 0; i < nHands; ++i)
	{
		[array addObject:[NormDistribution getRandomDistribution]];
	}
	[array sortUsingSelector:@selector(compareWith:)];
}

#pragma mark -
#pragma mark INBandit interface

-(int)handsCount
{
	return [array count];
}

-(double)tryHandleNumber:(int)handNum
{
	double res = [[array objectAtIndex:handNum] nextDouble];
	return res;
}

-(BOOL)isHandlePerfect:(int)handNum
{
	return (handNum == 0);
}

-(int)perfectHandleNumber
{
	return 0;
}

@end
