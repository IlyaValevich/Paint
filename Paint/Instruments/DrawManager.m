//
//  DrawManager.m
//  Paint
//
//  Created by Ilya on 8/1/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawManager.h"
@implementation DrawManager

-(void)drawFigure:(Instrument*) instrument
{
    if ([instrument.lineArray count] > 0) {
        for (int i = 0; i < [instrument.lineArray count]; i++) {
            NSMutableArray * array = [NSMutableArray arrayWithArray:[instrument.lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                [instrument drawAlgoritm:array];
            }
        }
    }
}

-(void)drawPreview:(Instrument*) instrument
{
    if ([instrument.pointArray count] > 0) {
        [instrument drawAlgoritm:instrument.pointArray];
    }
}

@end
