//
//  AverangerController.m
//  n-Handeled Bandit
//
//  Created by Илья on 10.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "AverangerController.h"


@implementation AverangerController


-(id)init
{
	if (![super init]) return nil;
	strategy = [[AverangeStrategy alloc] init];
	[self setColor:[NSColor greenColor]];
	return self;
}

-(double)epsilon
{
	return [(AverangeStrategy*)strategy alpha];
}

-(void)setEpsilon:(double)newEpsilon
{
	[(AverangeStrategy*)strategy setAlpha:newEpsilon];
}

-(IBAction)NSLog:(id)sender
{
	[super NSLog:sender];
	NSLog(@"epsilon=%F", [self epsilon]);
}


@end
