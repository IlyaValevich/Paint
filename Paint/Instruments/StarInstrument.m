//
//  StarInstrument.m
//  Paint
//
//  Created by Ilya on 7/30/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StarInstrument.h"
#import "DrawManager.h"

@interface StarInstrument()
@end

@implementation StarInstrument

@synthesize pointArray;
@synthesize rect;
@synthesize path;

- (void)drawAlgoritm:(NSMutableArray*) array{
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
    
    CGFloat xCenter = (myStartPoint.x + (myEndPoint.x - myStartPoint.x)/2 );
    CGFloat yCenter = (myStartPoint.y + (myEndPoint.y - myStartPoint.y)/2 );
    
    float w = sqrt(
                   pow((myEndPoint.x - myStartPoint.x),2)+
                   pow((myEndPoint.y - myStartPoint.y),2)) ;
    double r = w / 2.0;
    
    rect = CGRectMake (xCenter - r - 6,
                       yCenter - r - 6,
                       2*r + 12,
                       2*r + 12);
    
    float flip = -1.0;
    
    double theta = (2.0 * M_PI * (2.0 / 5.0))/4; // 72 degrees
    
    CGPathMoveToPoint(path, NULL, xCenter, r*flip+yCenter);
    bool temp = false;
    for (NSUInteger k=1; k<10; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        if(temp){
            temp = false;
        }else{
            x /= 2.7 ;
            y /= 2.7 ;
            temp = true;
        }
        CGPathAddLineToPoint(path, NULL, x+xCenter, y*flip+yCenter);
    }
    CGPathCloseSubpath(path);
}

@end
