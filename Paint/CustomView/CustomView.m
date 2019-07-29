//
//  CustomView.m
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//
#import "CustomView.h"
#import "InstrumentProtocol.h"

@interface CustomView(){
    UIImageView* tempImageView;
    id <InstrumentProtocol> instrument;
    NSMutableArray *pointArray;
}
@end

@implementation CustomView

- (id)init
{
    if (self = [super init]) {
        tempImageView = nil;
        pointArray=[[NSMutableArray alloc]init];
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
        pointArray=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    self.clearsContextBeforeDrawing = NO;
    [self.instrument draw];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.instrument.myBeginPoint = [touch locationInView:self];
    NSString *sPoint = NSStringFromCGPoint(self.instrument.myBeginPoint);
    [self.pointArray addObject:sPoint];

    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [NSArray arrayWithArray:self.pointArray];
    [self.instrument.lineArray addObject:array];
    self.pointArray = [[NSMutableArray alloc]init];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@synthesize tempImageView;

@synthesize instrument;

@synthesize pointArray;

@end
