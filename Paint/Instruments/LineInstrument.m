//
//  LineInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineInstrument.h"
#import "Figure.h"

@interface LineInstrument()
@property (nonatomic,readwrite) CGPoint myEndPoint;
@end

@implementation LineInstrument

@synthesize lineArray;
@synthesize myBeginPoint;
@synthesize tempImageView;

- (Figure*)makeFigure
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    [[UIColor greenColor] setStroke];
    
    CGContextSaveGState(context);
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 8.0f);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGContextBeginPath(context);
                myBeginPoint = CGPointFromString([array objectAtIndex:0]);
                CGPathMoveToPoint(path, NULL, myBeginPoint.x, myBeginPoint.y);
                
                CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
                CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
                
                
                CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
                CGContextSetLineWidth(context, 8.0);
                CGContextStrokePath(context);
            }
        }
    }

    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);

    return [[Figure alloc] init:CGRectMake(self.myBeginPoint.x,
                                           self.myBeginPoint.x,
                                            myBeginPoint.x - 1000,
                                            myBeginPoint.y - 1000)
                           path:path];
}

@end
