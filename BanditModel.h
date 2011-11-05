//
//  BanditModel.h
//  n-Handeled Bandit
//
//  Created by Илья on 25.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <stdlib.h>

#import "NormDistribution.h"
#import "INBandit.h"


@interface BanditModel : NSObject <INBandit>
{
	NSMutableArray* array;
}

-(id)initWith:(int)handsCount;

-(int)handsCount;
-(void)createBanditWith:(int)nHands;
-(double)tryHandleNumber:(int)handNum;
-(BOOL)isHandlePerfect:(int)handNum;
-(int)perfectHandleNumber;

@end
