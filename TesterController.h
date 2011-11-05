//
//  TesterController.h
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BaseStrategyController.h"
#import "Judge.h"


@interface TesterController : NSObject 
{
	BaseStrategyController* strategy;
	Judge* judge;
}

-(void) setStrategy:(BaseStrategyController*)newStrategy;
@property (assign) Judge* judge;

-(void)makeTestsCount:(int)testsCount 
		   handsCount:(int)handsCount 
	  recreationCount:(int)recreationCount; 

-(void)drawInRect:(NSRect)bounds;

@end
