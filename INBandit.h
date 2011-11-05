//
//  INBandit.h
//  n-Handeled Bandit
//
//  Created by Илья on 27.02.10.
//  Copyright 2010 ТвГУ. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@protocol INBandit

-(int)handsCount;
-(void)createBanditWith:(int)handles;
-(double)tryHandleNumber:(int)handNum;
-(BOOL)isHandlePerfect:(int)handNum;
-(int)perfectHandleNumber;


@end
