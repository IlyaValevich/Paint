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

@synthesize lineArray;
@synthesize mainView;

- (Figure*)makeFigure
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    if ([lineArray count] > 0) {
        for (int i = 0; i < [lineArray count]; i++) {
            NSArray * array = [NSArray arrayWithArray:[lineArray objectAtIndex:i]];
            if ([array count] > 0) {
                CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
                CGPathMoveToPoint(path, NULL, myStartPoint.x, myStartPoint.y);
                
                for (int j = 0; j < [array count] - 1; j++) {
                    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:j+1]);
                    CGPathAddLineToPoint(path,NULL, myEndPoint.x,myEndPoint.y);
                }
            }
        }
    }

    return [[Figure alloc] init:mainView.bounds  path:path];
}



@end
