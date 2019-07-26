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
    UIImageView* mainImageView;
    UIImageView* tempImageView;
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

-(id)initWithContext:(CGContextRef)context:(UIImageView *)mainImageView :(UIImageView *)tempImageView {
    if (self = [super init]) {
        self.pointArray=[[NSMutableArray alloc]init];
        self.lineArray=[[NSMutableArray alloc]init];
        self.context = context;
        self.mainImageView = mainImageView;
        self.tempImageView = tempImageView;
    }
    return self;
    
}

-(void)setContext:(CGContextRef)context{
    context = context;
}

-(void)setMainImageView:(UIImageView *)mainImageView{
    mainImageView = mainImageView;
}

-(void)setTempImageView:(UIImageView *)tempImageView{
    tempImageView = tempImageView;
}

- (UIImageView*)draw {
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
    mainImageView.clearsContextBeforeDrawing = NO;
    
    context = UIGraphicsGetCurrentContext();
    
    
    UIGraphicsBeginImageContext(mainImageView.frame.size);
    
    [tempImageView.image drawInRect:mainImageView.bounds];
    
    [[UIColor greenColor] set];
    CGContextSetLineWidth(context,10.0f);
    CGContextMoveToPoint(context,101.0f, 150.0f);
    CGContextAddLineToPoint(context,50.0f, 100.0f);
    
    CGContextStrokePath(context);
    //CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    tempImageView.alpha = 1;
    
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(mainImageView.frame.size);
    
    [mainImageView.image drawInRect:mainImageView.bounds blendMode:normal alpha:1];
    
    [tempImageView.image drawInRect:tempImageView.bounds blendMode:normal alpha:1];
    mainImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    tempImageView.image = nil;
    return mainImageView;
}

@synthesize lineArray;

@synthesize myBeginPoint;

@synthesize pointArray;

@synthesize context;

@synthesize tempImageView;

@synthesize mainImageView;

@end
