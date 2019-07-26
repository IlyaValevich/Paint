//
//  LineInstrument.h
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//
#import "InstrumentProtocol.h"

@interface LineInstrument : NSObject <InstrumentProtocol>{
    NSMutableArray *pointArray;
    NSMutableArray *lineArray;
    CGPoint myBeginPoint;
    CGContextRef context;
}
@end

@implementation LineInstrument

- (id)init
{
    if (self = [super init]) {
        pointArray=[[NSMutableArray alloc]init];
        lineArray=[[NSMutableArray alloc]init];
    }
    return self;
}

-(id)initWithContext:(CGContextRef)context{
    if (self = [super init]) {
        self.pointArray=[[NSMutableArray alloc]init];
        self.lineArray=[[NSMutableArray alloc]init];
        self.context = context;
    }
    return self;
    
}

-(void)setContext:(CGContextRef)context{
    context = context;
}

- (CGContextRef)draw {
    /*CGContextSaveGState(context);
    
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 8.0f);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);

    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGContextBeginPath(context);
                CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
                
                CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
                CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
                CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
                
                
                CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
                CGContextSetLineWidth(context, 8.0);
                CGContextStrokePath(context);
            }
        }
    }
    if ([pointArray count] > 0) {
        CGContextBeginPath(context);
        CGPoint myStartPoint = CGPointFromString([pointArray objectAtIndex:0]);
        CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
        
        CGPoint myEndPoint = CGPointFromString([pointArray objectAtIndex:[pointArray count] - 1]);
        CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
        
        CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
        CGContextSetLineWidth(context, 8.0);
        CGContextStrokePath(context);
    }
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);
    return context;
     */
    context = UIGraphicsGetCurrentContext();
    [[UIColor greenColor] set];
    CGContextSetLineWidth(context,10.0f);
    CGContextMoveToPoint(context,10.0f, 50.0f);
    CGContextAddLineToPoint(context,50.0f, 100.0f);
    CGContextStrokePath(context);
    return context;
}

@synthesize lineArray;

@synthesize myBeginPoint;

@synthesize pointArray;

@synthesize context;

@end
