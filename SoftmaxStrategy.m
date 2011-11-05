//
//  SoftmaxStrategy.m
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "SoftmaxStrategy.h"


@implementation SoftmaxStrategy

@synthesize temperature;

-(double)probabilityFor:(int)ind
{
	return exp(array[ind] / temperature);
}

-(double)sumOfProbabilities
{
	double res = 0.0;
	for (int i = 0; i < handsCount; ++i)
	{
		res += [self probabilityFor:i];
	}
	return res;
}

-(int)nextHandle
{
	int max = -1;
	
	if (handsCount > 0)
	{
		double sumProb = [self sumOfProbabilities];
		double rnd = [NormDistribution randFrom:0 to:1];
		double acum = 0.0;
		
		for (max = 0; max < handsCount; max++)
		{			
			acum += [self probabilityFor:max] / sumProb;
			if (rnd < acum)	return max;
		}	
	}
	return max;
}

@end
