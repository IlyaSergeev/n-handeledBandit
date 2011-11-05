//
//  BaseStrategyController.h
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IStrategy.h"


@interface BaseStrategyController : NSObject 
{
	BOOL isActive;
	NSColor* color;
	
	id<IStrategy> strategy;
}

@property (assign) id<IStrategy> strategy;
@property BOOL isActive;
@property double defaultFee;
@property (assign) NSColor* color;

-(IBAction)NSLog:(id)sender;

@end
