//
//  CustomView.m
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//
#import "CustomView.h"

@interface CustomView(){
    UIImageView* mainImageView;
    UIImageView* tempImageView;
}
@end

@implementation CustomView

- (id)init
{
    if (self = [super init]) {
        mainImageView = nil;
        tempImageView = nil;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        tempImageView = [[UIImageView alloc] initWithFrame:frame];
        tempImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:tempImageView];
        mainImageView = [[UIImageView alloc] initWithFrame:frame];
        mainImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:mainImageView];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    NSLog(@"%@", mainImageView.image);
    self.clearsContextBeforeDrawing = NO;
    mainImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.instrument setContext:UIGraphicsGetCurrentContext()];
    [self.instrument setMainImageView:mainImageView];
    [self.instrument setTempImageView:self.tempImageView];
    mainImageView = [self.instrument draw];

    

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    self.instrument.myBeginPoint = [touch locationInView:self];
    NSString *sPoint = NSStringFromCGPoint(self.instrument.myBeginPoint);
    [self.instrument.pointArray addObject:sPoint];
    
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    NSArray *array = [NSArray arrayWithArray:self.instrument.pointArray];
    [self.instrument.lineArray addObject:array];
    self.instrument.pointArray = [[NSMutableArray alloc]init];
  
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Canelled");
}

@end
