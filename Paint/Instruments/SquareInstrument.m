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

@synthesize pointArray;
@synthesize rect;
@synthesize path;


- (void)drawAlgoritm:(NSMutableArray*) array {
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
    
    CGFloat h = myEndPoint.x - myStartPoint.x;
    CGFloat w = myEndPoint.y - myStartPoint.y;
    
    h = MAX(h, w);
    w = h;
    if(myEndPoint.x < myStartPoint.x) {
        if(h > 0) {
            h = -h;
        }
    }
    if(myEndPoint.y < myStartPoint.y) {
        if(w > 0) {
            w = -w;
        }
    }
    
    rect = CGRectMake(myStartPoint.x,
                      myStartPoint.y,
                      h,
                      w);
    
    CGPathAddRect(path, NULL, rect);
    
}

@end
