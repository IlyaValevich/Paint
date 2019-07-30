//
//  PointInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PointInstrument.h"
#import <UIKit/UIKit.h>

@implementation PointInstrument

- (id)init
{
    if (self = [super init]) {
        lineArray=[[NSMutableArray alloc]init];
    }
    return self;
}


- (id)init:(UIImageView *)mainImageView
{
    if (self = [super init]) {
        //self.pointArray=[[NSMutableArray alloc]init];
        self.lineArray=[[NSMutableArray alloc]init];
        self.tempImageView = mainImageView;
    }
    return self;
}

- (void)draw
{
    tempImageView.clearsContextBeforeDrawing = NO;
    UIGraphicsBeginImageContext(tempImageView.frame.size);
    [tempImageView.image drawAtPoint:CGPointZero];
    CGContextRef context = UIGraphicsGetCurrentContext();
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
    
    CGContextRestoreGState(context);
    
    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [tempImageView setNeedsDisplay];
}





@synthesize lineArray;

@synthesize myBeginPoint;

@synthesize tempImageView;

@end
