//
//  StratigesArray.h
//  n-Handeled Bandit
//
//  Created by Илья on 08.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TesterController.h"
#import "GreedyController.h"
#import "EpsilonController.h"
#import "ModelProperties.h"
#import "AverangerController.h"
#import "SoftmaxController.h"

@interface StratigesArray : NSObject 
{
	IBOutlet GreedyController* greedySt;
	IBOutlet EpsilonController* epsilonSt;
	IBOutlet AverangerController* averangerSt;
	IBOutlet SoftmaxController* SoftmaxSt;
	
	IBOutlet ModelProperties* properties;
	
	NSMutableArray* testerConrollers;
}

-(void)setProperties:(ModelProperties*)prop;
-(void)recreationAll;

-(void)drawInRect:(NSRect)bounds;

@end
