//
//  NormDistribution.m
//  n-Handeled Bandit
//
//  Created by Илья on 23.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "NormDistribution.h"



@implementation NormDistribution

#pragma mark -
#pragma mark class method

+(double)randFrom:(double)from to:(double) to
{
	double res = rand() / (double)RAND_MAX;
	res *= to - from;
	res += from;
	return res;
}

#pragma mark -
#pragma mark properties

@synthesize mean;
@synthesize variance;


#pragma mark -
#pragma mark Constructors

-(id)init
{
	return [self initWithMean:0 variance:1];
}

-(id)initWithMean:(double)theMean variance:(double)theVariance
{
	self = [super init];
	if (self != nil)
	{
		mean = theMean;
		variance = theVariance;
	}
	return self;
}

+(double)nextDoubleWithMean:(double)mean withVariance:(double)variance
{	
	double U1 = 0;
	double U2 = 0;
	double V1 = 0;
	double V2 = 0;
	double S = 0;
	
	do
	{
		U1 = [NormDistribution randFrom:0 to:1];
		U2 = [NormDistribution randFrom:0 to:1];
		V1 = 2 * U1 - 1;
		V2 = 2 * U2 - 1;
		S = V1 * V1 + V2 * V2;
	}
	while (S >= 1);
	
	double res = sqrt(-2 * log(S) / S) * V1;
	
	return mean + sqrt(variance) * res;	
}


-(double)nextDouble
{
	return [NormDistribution nextDoubleWithMean:mean
								   withVariance:variance];
}

+(NormDistribution*)getRandomDistribution
{
	double m = [NormDistribution nextDoubleWithMean:0 withVariance:1];
	double var = 1;
	
	return [[[NormDistribution alloc] initWithMean:m variance:var] autorelease];
}

#pragma mark -
#pragma mark compare;

-(NSComparisonResult)compareWith:(NormDistribution*)distr
{
	int distMean = [distr mean];
	if (mean < distMean)
	{
		return NSOrderedDescending;
	}
	if (mean > distMean) 
	{
		return NSOrderedAscending;
	}
	return NSOrderedSame;
}

@end
