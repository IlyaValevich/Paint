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
    CGColorRef color;
}
@end

@implementation CustomView

@synthesize instrument;
@synthesize figuresArray;
@synthesize color;

- (id)init {
    if (self = [super init]) {
        instrument = [[PointInstrument alloc] init: self];
        figuresArray = [NSMutableArray array];
        color = [UIColor blackColor].CGColor;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        figuresArray = [NSMutableArray array];
        color = [UIColor blackColor].CGColor;
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    
    for (Figure *figure in figuresArray) {
        [figure draw];
    }
    [previewFigure draw];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSString *sPoint = NSStringFromCGPoint([touch locationInView:self]);
    [self.instrument.pointArray addObject:sPoint];
    
    //redraw old rect
    [self setNeedsDisplayInRect:previewFigure.rect];
    
    //draw new figure
    previewFigure = [self.instrument makeFigure];
   
    [self setNeedsDisplayInRect:previewFigure.rect];;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
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

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.instrument.pointArray removeAllObjects];
    previewFigure = nil;
    [self setNeedsDisplay];
}

- (void)clear {
    self.backgroundColor = [UIColor clearColor];
    [figuresArray removeLastObject];
    [instrument.pointArray removeAllObjects];
    previewFigure = nil;
    [self setNeedsDisplay];
}
@end
