//
//  Judge.m
//  n-Handeled Bandit
//
//  Created by Илья on 28.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "Judge.h"


@implementation Judge

#pragma mark -
#pragma mark properties

@synthesize logger;
@synthesize loggerCount;


#pragma mark -
#pragma mark Contstructors

-(id)init
{
	if ([super init] == nil) return nil;
	
	bandit = [[BanditModel alloc] init];
	strategy = nil;
	logger = nil;
	
	return self;
}

-(id)initWithModel:(id<INBandit>)theBandit strategy:(id <IStrategy>)theStrategy
{
	if (![self init]) return nil;
	
	[self setBandit:theBandit];
	[self setStrategy:theStrategy];
	
	return self;
}

- (void)createLoggerCount:(int)count
{
	if (count != loggerCount)
	{
		free(logger);
		logger = malloc(sizeof(double) * count);
		loggerCount = count;
	}
	[self clear];

}

- (void)dealloc
{
	free(logger);
	[super dealloc];
}

-(void)setBandit:(id<INBandit>)theBandit
{
	bandit = theBandit;
}

-(void)setStrategy:(id<IStrategy>)theStrategy
{
	strategy = theStrategy;
}

-(void)setBandit:(id<INBandit>)theBandit strategy:(id<IStrategy>)theStrategy
{
	[self setBandit:theBandit];
	[self setStrategy:strategy];
}

- (void)clear
{
	for (int i = 0; i < loggerCount; ++i)
	{
		logger[i] = 0.0;
	}
}

-(void)setDefaultFee:(double)theFee
{
	[strategy setDefaultFee:theFee];
}


#pragma mark -
#pragma mark game logic

- (void)makeNTests:(int)count games:(int)games hands:(int)hands
{
	double* res = malloc(sizeof(double) * games);
	
	for (int i = 0; i < games; ++i)
	{
		res[i] = 0;
	}
	
	for (int i = 0; i < count; ++i)
	{
		[bandit createBanditWith:hands];
		[self startGames:games];
		for (int i = 0; i < games; ++i)
		{
			res[i] += logger[i];
		}
	}
	
	free(logger);
	for (int i = 0; i < games; ++i)
	{
		res[i] /= count;
	}
	logger = res;
}

-(void)startGames:(int)maxGames
{
	[self createLoggerCount:maxGames];
	
	int perfects = 0;
	int choice;
	double fee;
	double coef = 0.0;
	
	[strategy setHandsCount:[bandit handsCount]];
	
	for (int i = 0; i < maxGames; ++i)
	{
		choice = [strategy nextHandle];
		fee = [bandit tryHandleNumber:choice];
		[strategy updateFee:fee toHandle:choice];
		
		if ([bandit isHandlePerfect:choice])
		{
			++perfects;
			coef = perfects / (double)(i+1);
		}
		//NSLog(@"choise=%d, fee=%F", choice, fee);
		logger[i] = coef;
	}
}

- (NSBezierPath*)besierPath:(NSRect)bounds
{
	if (loggerCount <= 0) return nil;
	
	NSBezierPath* path = [NSBezierPath bezierPath];
	NSPoint nextPoint = bounds.origin;	
	[path moveToPoint: nextPoint];
	
	double dx = bounds.size.width / (double)loggerCount;
	double maxY = bounds.size.height;
	double startY = bounds.origin.y;
	
	for (int i = 0; i < loggerCount; ++i)
	{
		nextPoint.x += dx;
		nextPoint.y = startY + maxY * logger[i];		
		[path lineToPoint:nextPoint];		
	}
	return path;
}

@end
