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

- (void)drawAlgoritm:(NSMutableArray*) array {
    CGPoint myStartPoint = CGPointFromString([array objectAtIndex:0]);
    CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);

    CGFloat h = myEndPoint.x - myStartPoint.x;
    CGFloat w = myEndPoint.y - myStartPoint.y;
    
    [self calcPoints:&myStartPoint endPoint:&myEndPoint];
    
    rect = CGRectMake(myStartPoint.x,
                      myStartPoint.y,
                      fabs(h),
                      fabs(w));
    
    CGFloat xCenter = rect.origin.x + rect.size.width/2;
    CGFloat yCenter = rect.origin.y + rect.size.height/2;
    
    float flip = -1.0;
    double theta = (2.0 * M_PI * (2.0 / 5.0))/4; // 36 degrees
    
    CGPathMoveToPoint(path, NULL, xCenter, yCenter - fabs(w)/2 );
    
    for (NSUInteger k=1; k<10; k++) {
        float x = rect.size.width/2 * sin(k * theta);
        float y = rect.size.height/2 * cos(k * theta);
        if(k % 2){
            x /= 2.7;
            y /= 2.7;
        }
        CGPathAddLineToPoint(path, NULL, x+xCenter, y*flip+yCenter);
    }
    CGPathCloseSubpath(path);
}

@end
