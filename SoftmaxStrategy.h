//
//  SoftmaxStrategy.h
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GreedyStrategy.h"
#import "NormDistribution.h"


@interface SoftmaxStrategy : GreedyStrategy 
{
	double temperature;
}

@property double temperature;

@end
