//
//  Stragedy.h
//  n-Handeled Bandit
//
//  Created by Илья on 27.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@protocol IStrategy <NSObject>

- (int)handsCount;
- (void)setHandsCount:(int)handsCount;

- (double)defaultFee;
- (void)setDefaultFee:(double)defaultFee;

-(int)nextHandle;
-(void)updateFee:(double)theFee toHandle:(int)handNum;
-(void)clear;

@end
