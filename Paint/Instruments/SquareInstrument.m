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

@interface SquareInstrument()
@property (nonatomic,readwrite) CGRect rect;
@end

@implementation SquareInstrument

@synthesize lineArray;
@synthesize myBeginPoint;
@synthesize tempImageView;
@synthesize rect;

- (Figure *)makeFigure
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    [[UIColor greenColor] setStroke];
    
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 8.0f);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGContextBeginPath(context);
                CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
                
                CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
                
                rect = CGRectMake (myStartPoint.x,
                                          myStartPoint.y,
                                          myEndPoint.x - myStartPoint.x,
                                          myEndPoint.x - myStartPoint.x);
                //CGContextAddRect(context, rect);
                CGPathAddRect(path, NULL, rect);
                //CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
                //CGContextSetLineWidth(context, 8.0);
                //CGContextStrokePath(context);
            }
        }
    }
    
    CGContextAddPath(context, path);
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGContextStrokePath(context);
   
    
    return [[Figure alloc] init:rect  path:path];
}

@end
