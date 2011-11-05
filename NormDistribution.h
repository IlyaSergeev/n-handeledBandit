//
//  NormDistribution.h
//  n-Handeled Bandit
//
//  Created by Илья on 23.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NormDistribution : NSObject 
{
	double mean;
	double variance;
}

@property double mean;
@property double variance;

-(id)initWithMean:(double)theMean variance:(double)theVariance;
-(double)nextDouble;
+(double)nextDoubleWithMean:(double)mean withVariance:(double)variance;
+(double)randFrom:(double)from to:(double)to;

-(NSComparisonResult)compareWith:(NormDistribution*)distr;

+(NormDistribution*)getRandomDistribution;

@end
