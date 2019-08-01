//
//  DrawManager.m
//  Paint
//
//  Created by Ilya on 8/1/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawManager.h"
#import "Figure.h"
#import <UIKit/UIKit.h>

@implementation DrawManager

- (Figure*)makeFigure:(Instrument*) instrument{
    instrument.path = CGPathCreateMutable();
    
    [instrument drawFigure];
    [instrument drawPreview];
    CGRect rect = instrument.rect;
    [instrument calcRect: &rect];
    
    return [[Figure alloc] init: instrument.rect path: instrument.path];
}

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
