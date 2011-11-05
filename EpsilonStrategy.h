//
//  EpsilonStrategy.h
//  n-Handeled Bandit
//
//  Created by Илья on 07.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GreedyStrategy.h"


@interface EpsilonStrategy : GreedyStrategy 
{
	double epsilon;
}

@property double epsilon;

@end
