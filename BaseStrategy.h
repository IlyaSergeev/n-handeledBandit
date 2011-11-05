//
//  BaseStrategy.h
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface BaseStrategy : NSObject
{
	int handsCount;
	double defaultFee;
}

@property int handsCount;
@property double defaultFee;

@end
