//
//  ModelProperties.h
//  n-Handeled Bandit
//
//  Created by Илья on 07.03.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ModelProperties : NSObject
{
	int recreationCount;
	int testsCount;
	int handsCount;
}

@property int recreationCount;
@property int testsCount;
@property int handsCount;

-(IBAction)nslog:(id)sender;

@end
