//
//  ModelProperties.m
//  n-Handeled Bandit
//
//  Created by Илья on 07.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "ModelProperties.h"


@implementation ModelProperties

@synthesize recreationCount;
@synthesize testsCount;
@synthesize handsCount;

-(id)init
{
	self = [super init];
	if (self != nil)
	{
		[self setHandsCount:10];
		[self setTestsCount:1000];
		[self setRecreationCount:100];
	}	
	 return self;
}


#pragma mark -
#pragma mark Actions

-(IBAction)nslog:(id)sender
{
	NSLog(@"hands=%d, recrCount=%d, testsCount=%d", handsCount, recreationCount, testsCount);
}

@end
