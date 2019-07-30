//
//  PointInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PointInstrument.h"

@implementation PointInstrument

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
                CGPathMoveToPoint(path, NULL, self.myBeginPoint.x, self.myBeginPoint.y);
                
                for (int j = 0; j < [array count] - 1; j++) {
                    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:j+1]);
                    CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
                }
                
                CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
                CGContextSetLineWidth(context, 8.0);
                CGContextStrokePath(context);
            }
        }
    }
    
    CGContextRestoreGState(context);
    

    CGContextAddPath(context, path);
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGContextStrokePath(context);
    //CGPathRelease(path);
    
    return [[Figure alloc] init:tempImageView.bounds  path:path];
}



@end
