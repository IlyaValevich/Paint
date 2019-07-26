//
//  PointIntrument.h
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//
#import "InstrumentProtocol.h"


@interface PointInstrument : NSObject <InstrumentProtocol>{
    NSMutableArray *pointArray;
    NSMutableArray *lineArray;
    CGPoint myBeginPoint;
    CGContextRef context;
    UIImageView *mainImageView;
    UIImageView *tempImageView;
}

@end

@implementation PointInstrument

- (id)init
{
    if (self = [super init]) {
        pointArray=[[NSMutableArray alloc]init];
        lineArray=[[NSMutableArray alloc]init];
//        self.context = nil;
    }
    return self;
}

-(id)init:(CGContextRef)context:(UIImageView *)mainImageView :(UIImageView *)tempImageView {
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

- (UIImageView *)draw {
    /*context = UIGraphicsGetCurrentContext();
    NSLog(@"draw");
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
    
    if ([pointArray count] > 0) {
        CGContextBeginPath(context);
        CGPoint myStartPoint = CGPointFromString([pointArray objectAtIndex:0]);
        CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
        
        for(int j = 0; j < [pointArray count]-1; j++){
            CGPoint myEndPoint = CGPointFromString([pointArray objectAtIndex:j + 1]);
            CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
        }
        CGContextSetStrokeColorWithColor(context,[[UIColor blackColor] CGColor]);
        CGContextSetLineWidth(context, 8.0);
        CGContextStrokePath(context);
    }
    
    CGContextRestoreGState(context);
    return context;
    
     
     
     
    //context = UIGraphicsGetCurrentContext();
    
    
    UIGraphicsBeginImageContext(tempImageView.frame.size);
    context = UIGraphicsGetCurrentContext();
    [tempImageView.image drawInRect:tempImageView.frame];
    
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
    */
    NSLog(@"%@", mainImageView.image);
    mainImageView.clearsContextBeforeDrawing = NO;
    
    context = UIGraphicsGetCurrentContext();
    
    
    UIGraphicsBeginImageContext(mainImageView.frame.size);
    
    [tempImageView.image drawInRect:mainImageView.bounds];
    
    [[UIColor greenColor] set];
    CGContextSetLineWidth(context,10.0f);
    CGContextMoveToPoint(context,10.0f, 50.0f);
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
    NSLog(@"%@", mainImageView.image);
    return mainImageView;
    
}



@synthesize lineArray;

@synthesize myBeginPoint;

@synthesize pointArray;

@synthesize context;

@synthesize mainImageView;

@synthesize tempImageView;

@end
