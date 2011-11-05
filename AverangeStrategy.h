//
//  AverangeStrategy.h
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BaseStrategy.h"
#import "IStrategy.h"


@interface AverangeStrategy : BaseStrategy <IStrategy>
{
	double* array;
	double alpha;
}

@property double alpha;

-(int)nextHandle;
-(void)updateFee:(double)theFee toHandle:(int)handNum;

@end
