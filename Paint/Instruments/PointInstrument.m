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
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    CGPathMoveToPoint(path, NULL, myStartPoint.x, myStartPoint.y);
   
    if ([array count]>3)
    for (int j = 1; j < [array count] - 2  ; j++) {
        if(j % 3 == 1){
            CGPoint myBufPoint = CGPointFromString([array objectAtIndex:j ]);
            CGPoint myMidPoint = CGPointFromString([array objectAtIndex:j + 1]);
            CGPoint myEndPoint = CGPointFromString([array objectAtIndex:j + 2]);
            CGPathAddCurveToPoint(path, NULL,myBufPoint.x,myBufPoint.y ,myMidPoint.x, myMidPoint.y, myEndPoint.x, myEndPoint.y);
        }
    }
    
}

@end
