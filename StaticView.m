//
//  StaticView.m
//  n-Handeled Bandit
//
//  Created by Илья on 06.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import "StaticView.h"


@implementation StaticView

#pragma mark -
#pragma mark initualisation

- (void)dealloc
{
	[super dealloc];
}

- (id)initWithFrame:(NSRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) 
	{		
		srand(time(nil));
		[modelController recreationAll];
    }
    return self;
}


#pragma mark -
#pragma mark Drawing

- (void)drawRect:(NSRect)dirtyRect 
{
	[modelController drawInRect:[self getDrawBounds]];
}

#pragma mark -
#pragma mark Calculations

- (NSPoint)getRealOriginFrom:(NSView*)view
{
	return [self convertPoint:[view bounds].origin
					 fromView:view];
}

-(NSRect)getDrawBounds
{
	NSPoint flooPoint = [self getRealOriginFrom:floorLimit];
	NSPoint horPoint = [self getRealOriginFrom:horisontalLine]; 	
	NSPoint rightPoint = [self getRealOriginFrom:rightLimit];
	NSPoint vertPoint = [self getRealOriginFrom:verticalLine];	
	
	return NSMakeRect(vertPoint.x + [verticalLine bounds].size.width/2, 
					  horPoint.y + [horisontalLine bounds].size.height/2,
					  rightPoint.x - vertPoint.x, 
					  flooPoint.y - horPoint.y);
}

#pragma mark -
#pragma mark Actions

-(IBAction)recreateModel:(id)sender
{
	[modelController recreationAll];
	[self redraw:sender];
}

- (IBAction)redraw:(id)sender
{	
	[self setNeedsDisplay:YES];
}

@end
