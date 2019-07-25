//
//  StarInstrument.h
//  Paint
//
//  Created by Ilya on 7/25/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "InstrumentProtocol.h"
#import "StateManager.h"

@interface StarInstrument : NSObject <InstrumentProtocol>{
}
@end

@implementation StarInstrument

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
                
                CGPoint myEndPoint = CGPointFromString([array objectAtIndex:[array count] - 1]);
                
                
                CGFloat xCenter = (myStartPoint.x + (myEndPoint.x - myStartPoint.x)/2 );
                CGFloat yCenter = (myStartPoint.y + (myEndPoint.y - myStartPoint.y)/2 );
                
                
                float w = sqrt(pow((myEndPoint.x - myStartPoint.x),2) + pow((myEndPoint.y - myStartPoint.y),2)) ;
                double r = w / 2.0;
                float flip = -1.0;
                
                CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
                
                CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
                
                double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
                
                CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
                
                for (NSUInteger k=1; k<5; k++)
                {
                    float x = r * sin(k * theta);
                    float y = r * cos(k * theta);
                    CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
                }
                
                CGContextClosePath(context);
                CGContextFillPath(context);
                
 
               // CGRect rect = CGRectMake (myStartPoint.x, myStartPoint.y, (myEndPoint.x - myStartPoint.x), (myEndPoint.y - myStartPoint.y));
               // CGContextAddRect(context, rect);
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
        
        CGPoint myEndPoint = CGPointFromString([sharedStateManager.pointArray objectAtIndex:[sharedStateManager.pointArray count] - 1]);
        
        CGFloat xCenter = (myStartPoint.x + (myEndPoint.x - myStartPoint.x)/2 );
        CGFloat yCenter = (myStartPoint.y + (myEndPoint.y - myStartPoint.y)/2 );
        
        float w = sqrt(pow((myEndPoint.x - myStartPoint.x),2) + pow((myEndPoint.y - myStartPoint.y),2)) ;
        double r = w / 2.0;
        float flip = -1.0;
        
        CGContextSetFillColorWithColor(context, [[UIColor blackColor] CGColor]);
        
        CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
        
        double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
        
        CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
        
        for (NSUInteger k=1; k<5; k++)
        {
            float x = r * sin(k * theta);
            float y = r * cos(k * theta);
            CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
        }
        
        CGContextClosePath(context);
        CGContextFillPath(context);;
        
        //CGRect rect = CGRectMake (myStartPoint.x, myStartPoint.y, (myEndPoint.x - myStartPoint.x), (myEndPoint.y - myStartPoint.y));
       // CGContextAddRect(context, rect);
        
        CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
        CGContextSetLineWidth(context, 8.0);
        CGContextStrokePath(context);
    }
    
    
    
    
}


@end
