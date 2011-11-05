//
//  StaticView.h
//  n-Handeled Bandit
//
//  Created by Илья on 06.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StratigesArray.h"
#import "ModelProperties.h"

@interface StaticView : NSView 
{
	IBOutlet NSBox* verticalLine;
	IBOutlet NSBox* horisontalLine;
	IBOutlet NSBox* floorLimit;
	IBOutlet NSBox* rightLimit;

	IBOutlet StratigesArray* modelController;
}

-(IBAction)redraw:(id)sender;
-(IBAction)recreateModel:(id)sender;

-(NSRect)getDrawBounds;

@end
