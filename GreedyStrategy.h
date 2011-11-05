//
//  GreedyStragedy.h
//  n-Handeled Bandit
//
//  Created by Илья on 27.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IStrategy.h"
#import <stdlib.h>
#import "BaseStrategy.h"


@interface GreedyStrategy : BaseStrategy <IStrategy>
{
	double* array;
	double alpha;
}

@property int N;

-(int)nextHandle;
-(void)updateFee:(double)theFee toHandle:(int)handNum;

@end
