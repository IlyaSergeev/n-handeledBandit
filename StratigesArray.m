//
//  StratigesArray.m
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "StratigesArray.h"


@implementation StratigesArray

#pragma mark creation and release
-(id)init
{
	self = [super init];
	if (self != nil)
	{
		testerConrollers = [[NSMutableArray alloc] init];
		
		for (int i = 0; i < 4; ++i)
		{
			[testerConrollers addObject:[[TesterController alloc] init]];
		}
	}
	return self;
}

-(void)dealloc
{	
	[testerConrollers release];
	[super dealloc];
}

-(void)refreshTester:(int)ind withStrategy:(BaseStrategyController*)strategy
{
	TesterController* tester = [testerConrollers objectAtIndex:ind];
	[tester setStrategy:strategy];
}

-(void)refreshTesters
{
	[self refreshTester:0 withStrategy:greedySt];
	[self refreshTester:1 withStrategy:epsilonSt];
	[self refreshTester:2 withStrategy:averangerSt];
	[self refreshTester:3 withStrategy:SoftmaxSt];
}


#pragma mark Testing

-(void)recreatinoModelFor:(int)modelNum
{
	TesterController* tester = [testerConrollers objectAtIndex:modelNum];
	[tester makeTestsCount:[properties testsCount]
				handsCount:[properties handsCount] 
		   recreationCount:[properties recreationCount] ];
}

-(void)recreationAll
{
	[self refreshTesters];
	int count = [testerConrollers count];
	for (int i = 0; i < count; ++i)	[self recreatinoModelFor:i];
}

-(void)drawInRect:(NSRect)bounds
{
	int count = [testerConrollers count];
	TesterController* tester;
	
	for (int i = 0; i < count; ++i)
	{
		tester = [testerConrollers objectAtIndex:i];
		[tester drawInRect:bounds];
	}
}

-(void)setProperties:(ModelProperties*)prop
{
	properties = prop;
	[self recreationAll];
}

@end
