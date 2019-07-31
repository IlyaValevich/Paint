//
//  SquareInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SquareInstrument.h"
#include <math.h>

@implementation SquareInstrument

@synthesize lineArray;
@synthesize rect;

- (Figure *)makeFigure
{
    CGMutablePathRef path = CGPathCreateMutable();

    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
                
                CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
                
                CGFloat xCenter = (myStartPoint.x + (myEndPoint.x - myStartPoint.x)/2 );
                CGFloat yCenter = (myStartPoint.y + (myEndPoint.y - myStartPoint.y)/2 );
                
                float w = sqrt(
                               pow((myEndPoint.x - myStartPoint.x),2)+
                               pow((myEndPoint.y - myStartPoint.y),2)) ;
                
                rect = CGRectMake(xCenter-w/2 , yCenter-w/2 , w, w);
                
                CGPathAddRect(path, NULL, rect);
            }
        }
    }
    
    [super calcRect:&rect];
    return [[Figure alloc] init:rect  path:path];
}

@end
