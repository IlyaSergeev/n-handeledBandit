//
//  Judge.h
//  n-Handeled Bandit
//
//  Created by Илья on 28.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import	"INBandit.h"
#import "BanditModel.h"
#import "IStrategy.h"


@interface Judge : NSObject 
{
	id <INBandit> bandit;
	id <IStrategy> strategy;
	
	double* logger;
	int loggerCount;
}

@property double* logger;
@property int loggerCount;

-(id)initWithModel:(id<INBandit>)theBandit strategy:(id <IStrategy>)theStrategy;
- (void)clear;

- (void)setBandit:(id<INBandit>)theBandit;
- (void)setStrategy:(id<IStrategy>)theStrategy;
- (void)setBandit:(id<INBandit>)theBandit strategy:(id<IStrategy>)theStrategy;
- (void)setDefaultFee:(double)theFee;

- (void)makeNTests:(int)count games:(int)games hands:(int)hands;
- (void)startGames:(int)maxGames;

- (NSBezierPath*)besierPath:(NSRect)bounds;

@end
