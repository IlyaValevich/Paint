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
//@synthesize mainView;
@synthesize path;
@synthesize rect;

- (void)drawAlgoritm:(NSMutableArray*) array {
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    CGPathMoveToPoint(path, NULL, myStartPoint.x, myStartPoint.y);
    
    for (int j = 0; j < [array count] - 1; j++) {
        CGPoint myEndPoint = CGPointFromString([array objectAtIndex:j+1]);
        CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
    }
}

@end
