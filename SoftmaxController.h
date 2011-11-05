//
//  SoftmaxController.h
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GreedyController.h"
#import "SoftmaxStrategy.h"

@interface SoftmaxController : GreedyController {}

@property double temperature;

@end
