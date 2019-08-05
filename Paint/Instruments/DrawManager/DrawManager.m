//
//  DrawManager.m
//  Paint
//
//  Created by Ilya on 8/1/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawManager.h"
#import "Instrument.h"
#import "Figure.h"
#import <UIKit/UIKit.h>

@implementation DrawManager

- (Figure*)makeFigure:(Instrument*) instrument {
    instrument.path = CGPathCreateMutable();
    [self drawFigure:instrument];
    [instrument calcRect];
    return [[Figure alloc] init: instrument.rect path: instrument.path];
}

- (void)drawFigure:(Instrument*) instrument {
    if ([instrument.pointArray count] > 0) {
        [instrument drawAlgoritm:instrument.pointArray];
    }
}

@end
