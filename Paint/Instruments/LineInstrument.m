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

@implementation LineInstrument

@synthesize lineArray;
@synthesize pointArray;
@synthesize rect;

- (Figure*)makeFigure
{
    CGMutablePathRef path = CGPathCreateMutable();

    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
                CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
                
                CGPathMoveToPoint(path, NULL, myStartPoint.x, myStartPoint.y);
                CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
                
                CGFloat h = myEndPoint.x - myStartPoint.x;
                CGFloat w = myEndPoint.y - myStartPoint.y;
                
                [self calcPoints:&myStartPoint endPoint:&myEndPoint];
                
                rect = CGRectMake(myStartPoint.x,
                                  myStartPoint.y,
                                  fabs(h),
                                  fabs(w));

            }
        }
    }
    
    if ([pointArray count] > 0) {
    
            CGPoint myStartPoint = CGPointFromString([pointArray objectAtIndex:0]);
            CGPoint myEndPoint = CGPointFromString([pointArray objectAtIndex:[pointArray count] - 1]);
                
            CGPathMoveToPoint(path, NULL, myStartPoint.x, myStartPoint.y);
            CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
                
            CGFloat h = myEndPoint.x - myStartPoint.x;
            CGFloat w = myEndPoint.y - myStartPoint.y;
                
            [self calcPoints:&myStartPoint endPoint:&myEndPoint];
                
            rect = CGRectMake(myStartPoint.x,
                              myStartPoint.y,
                              fabs(h),
                              fabs(w));
                
            }
    
    
   
    [self calcRect:&rect];
    
    return [[Figure alloc] init:rect path:path];
}

- (void)calcRect:(CGRect*) rect
{
    rect->origin.x -= 5;
    rect->origin.y -= 5;
    rect->size.height += 10;
    rect->size.width += 10;
}

- (void)calcPoints:(CGPoint*) startPoint endPoint:(CGPoint*) endPoint
{
    if(startPoint->x > endPoint->x){
        CGFloat temp = startPoint->x;
        startPoint->x = endPoint->x;
        endPoint->x = temp;
    }
    if (startPoint->y > endPoint->y) {
        CGFloat temp = startPoint->x;
        startPoint->y = endPoint->y;
        endPoint->y = temp;
    }
}
@end
