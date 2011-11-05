//
//  EpsilonController.h
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BaseStrategyController.h"
#import "EpsilonStrategy.h"


@interface EpsilonController : BaseStrategyController {}

@property int N;
@property double epsilon;

@end
