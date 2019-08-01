//
//  LineInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineInstrument.h"


@implementation LineInstrument

@synthesize lineArray;
@synthesize pointArray;
@synthesize rect;
@synthesize path;

- (Figure*)makeFigure
{
    path = CGPathCreateMutable();

    [self drawFigure];
    [self drawPreview];
    [self calcRect:&rect];
    
    return [[Figure alloc] init:rect path:path];
}

-(void)drawAlgoritm:(NSMutableArray*) array
{
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
