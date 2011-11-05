//
//  GreedyController.m
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "GreedyController.h"


@implementation GreedyController

-(id)init
{
	if (![super init]) return nil;
	strategy = [[GreedyStrategy alloc] init];
	[self setColor:[NSColor redColor]];
	return self;
}

-(void)setN:(int)theN
{
	[(GreedyStrategy*)strategy setN:theN];
}

-(int)N
{
	return [(GreedyStrategy*)strategy N];
}

-(IBAction)NSLog:(id)sender
{
	[super NSLog:sender];
	NSLog(@"GreedyStrategy N=%d, defaultFee=%F", [self N], [self defaultFee]);
}

@end
