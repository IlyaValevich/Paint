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
    NSMutableArray<Figure *> *figuresArray;
    Figure *previewFigure;
}
@end

@implementation CustomView

@synthesize instrument;
@synthesize figuresArray;

- (id)init{
    if (self = [super init]) {
        instrument = [[PointInstrument alloc] init: self];
        figuresArray = [NSMutableArray array];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        figuresArray = [NSMutableArray array];
    }
    return self;
}

- (void) drawRect:(CGRect)rect{
    [previewFigure draw];

    for (Figure *figure in figuresArray) {
        [figure draw];
        }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSString *sPoint = NSStringFromCGPoint([touch locationInView:self]);
    [self.instrument.pointArray addObject:sPoint];
    
    //redraw old rect
    [self setNeedsDisplayInRect:previewFigure.rect];
    
    //draw new figure
    previewFigure = [self.instrument makeFigure];
    [self setNeedsDisplayInRect:previewFigure.rect];;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"end");
    
    UITouch *touch = [touches anyObject];
    NSString *sPoint = NSStringFromCGPoint([touch locationInView:self]);
    [self.instrument.pointArray addObject:sPoint];
    
    //redraw old rect
    [self setNeedsDisplayInRect:previewFigure.rect];
    
    previewFigure = [self.instrument makeFigure];
    if(previewFigure){
        [figuresArray addObject:previewFigure];
        [self setNeedsDisplayInRect:previewFigure.rect];
    }
    
    [self.instrument.pointArray removeAllObjects];
    previewFigure = nil;
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"cancel");
    [self.instrument.pointArray removeAllObjects];
    previewFigure = nil;
    [self setNeedsDisplay];
}

- (void)clear{
    self.backgroundColor = [UIColor clearColor];
    [figuresArray removeLastObject];
    [instrument.pointArray removeAllObjects];
    previewFigure = nil;
    [self setNeedsDisplay];
}
@end
