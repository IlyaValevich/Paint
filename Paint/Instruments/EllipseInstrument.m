//
//  EllipseInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EllipseInstrument.h"

@implementation EllipseInstrument

@synthesize lineArray;
@synthesize pointArray;
@synthesize rect;
@synthesize path;

- (Figure *)makeFigure
{
    path = CGPathCreateMutable();
    
    [self drawFigure];
    [self drawPreview];
    [self calcRect:&rect];
    return [[Figure alloc] init:rect  path:path];
}

-(void)drawFigure
{
    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSMutableArray * array = [NSMutableArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                [self drawAlgoritm:array];
            }
        }
    }
}

-(void)drawPreview
{
    if ([pointArray count] > 0) {
        [self drawAlgoritm:pointArray];
    }
}

-(void)drawAlgoritm:(NSMutableArray*) array
{
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
    
    CGFloat h = myEndPoint.x - myStartPoint.x;
    CGFloat w = myEndPoint.y - myStartPoint.y;
    
    [self calcPoints:&myStartPoint endPoint:&myEndPoint];
    
    rect = CGRectMake(myStartPoint.x,
                      myStartPoint.y,
                      fabs(h),
                      fabs(w));
    
    CGPathAddEllipseInRect(path, NULL, rect);
}

@end
