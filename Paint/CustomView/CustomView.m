//
//  CustomView.m
//  Paint
//
//  Created by Ilya on 7/24/19.
//  Copyright © 2019 Ilya. All rights reserved.
//

#import "CustomView.h"
#import "InstrumentProtocol.h"
#import "PointInstrument.h"
#import "Figure.h"

@interface CustomView(){
    id <InstrumentProtocol> instrument;
    NSMutableArray *pointArray;
    NSMutableArray<Figure *> *figuresArray;
}
@end

@implementation CustomView

@synthesize instrument;
@synthesize pointArray;
@synthesize figuresArray;

- (id)init
{
    if (self = [super init]) {
        instrument = [[PointInstrument alloc] init: self];
        pointArray = [[NSMutableArray alloc] init];
        figuresArray = [NSMutableArray array];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        pointArray=[[NSMutableArray alloc] init];
        figuresArray = [NSMutableArray array];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    for (Figure *figure in figuresArray) {
        [figure draw];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSString *sPoint = NSStringFromCGPoint([touch locationInView:self]);
    [self.pointArray addObject:sPoint];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [NSArray arrayWithArray:self.pointArray];
    [self.instrument.lineArray addObject:array];
    [self.pointArray removeAllObjects];
    
    Figure *temp = [self.instrument makeFigure];
    if(temp){
        [figuresArray addObject:temp];
        [self setNeedsDisplayInRect:temp.rect];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)clear
{
    self.backgroundColor = [UIColor clearColor];
    [pointArray removeAllObjects];
    [figuresArray removeAllObjects];
    [instrument.lineArray removeAllObjects];
    [self setNeedsDisplay];
}
@end
