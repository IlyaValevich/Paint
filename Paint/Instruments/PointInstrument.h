//
//  PointIntrument.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//
#import "InstrumentProtocol.h"
#import "StateManager.h"

@interface PointInstrument : NSObject <InstrumentProtocol>{

}

@end

@implementation PointInstrument

- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)draw {
    
    StateManager *sharedStateManager = [StateManager sharedStateManager];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 8.0f);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    if ([sharedStateManager.lineArray count] > 0) {
        for (int i = 0; i < [sharedStateManager.lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[sharedStateManager.lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGContextBeginPath(context);
                CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
                CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
                
                for (int j = 0; j < [array count] - 1; j++) {
                    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:j+1]);
                    CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
                }
                
                CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
                CGContextSetLineWidth(context, 8.0);
                CGContextStrokePath(context);
            }
        }
    }
    
    if ([sharedStateManager.pointArray count] > 0) {
        CGContextBeginPath(context);
        CGPoint myStartPoint = CGPointFromString([sharedStateManager.pointArray objectAtIndex:0]);
        CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
        
        for(int j = 0; j < [sharedStateManager.pointArray count]-1; j++){
            CGPoint myEndPoint = CGPointFromString([sharedStateManager.pointArray objectAtIndex:j + 1]);
            CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
        }
        CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
        CGContextSetLineWidth(context, 8.0);
        CGContextStrokePath(context);
    }
}



@end
