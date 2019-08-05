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

@synthesize pointArray;
@synthesize path;
@synthesize rect;

- (void)drawAlgoritm:(NSMutableArray*) array {
   // UIBezierPath *newPath = [UIBezierPath bezierPathWithCGPath:path];
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    //[newPath moveToPoint:myStartPoint];
    CGPathMoveToPoint(path, NULL, myStartPoint.x, myStartPoint.y);
    
    for (int j = 0; j < [array count] - 1; j++) {
        CGPoint myEndPoint = CGPointFromString([array objectAtIndex:j+1]);
        CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
        //[newPath moveToPoint:myEndPoint];

    }
    //path = CGPathCreateMutableCopy(newPath.CGPath);
    //newPath.CGPath;
    
}

@end
