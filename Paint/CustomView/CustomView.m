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
    Figure *previewFigure;
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
        pointArray = [NSMutableArray new];
        figuresArray = [NSMutableArray array];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        pointArray = [NSMutableArray new];
        figuresArray = [NSMutableArray array];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    [previewFigure draw];

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
    [self.instrument.pointArray addObject:sPoint];
    
    //redraw old rect
    CGRect rect = previewFigure.rect;
    [self setNeedsDisplayInRect:rect];
    
    //draw new figure
    previewFigure = [self.instrument makeFigure];
    rect = previewFigure.rect;
    [self setNeedsDisplayInRect:rect];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    NSString *sPoint = NSStringFromCGPoint([touch locationInView:self]);
    [self.instrument.pointArray addObject:sPoint];
    
    previewFigure = [self.instrument makeFigure];
    if(previewFigure){
        [figuresArray addObject:previewFigure];
        [self setNeedsDisplayInRect:previewFigure.rect];
    }
    
    [self.instrument.pointArray removeAllObjects];
    previewFigure = nil;
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.instrument.pointArray removeAllObjects];
    previewFigure = nil;
     [self setNeedsDisplay];
}

-(void)clear
{
    self.backgroundColor = [UIColor clearColor];
    [pointArray removeAllObjects];
    [figuresArray removeLastObject];
    [instrument.pointArray removeAllObjects];
    previewFigure = nil;
    [self setNeedsDisplay];
}
@end
