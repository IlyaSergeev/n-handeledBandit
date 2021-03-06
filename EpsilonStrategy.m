//
//  EpsilonStrategy.m
//  n-Handeled Bandit
//
//  Created by Илья on 07.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "EpsilonStrategy.h"


@implementation EpsilonStrategy

-(id)init
{
	self = [super init];
	if (self != nil)
	{
		epsilon = 0.1;
	}
	return self;
}

-(int)randomHandle
{	
	if (handsCount > 1)
	{
		int res = rand() % (handsCount-1);
		if (res >= [super nextHandle])
		{
			res++;
		}
		return res;
	}
	return 0;
}

-(int)nextHandle
{
	if (rand() / (double)RAND_MAX < epsilon)
	{
		return [self randomHandle];
	}
	else 
	{
		return [super nextHandle];
	}
}

@synthesize epsilon;

@end
