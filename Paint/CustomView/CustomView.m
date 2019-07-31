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
    
    previewFigure = [self.instrument makeFigure];
    CGRect rect = previewFigure.rect;
    rect.origin.x -= [touch locationInView:self].x + 50;
    rect.origin.y -= [touch locationInView:self].y + 50;
    rect.size.height += 2*([touch locationInView:self].x + 50);
    rect.size.width += 2*([touch locationInView:self].y+ 50);
    
    [self setNeedsDisplayInRect:rect];
   
    
    
  
  

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [NSArray arrayWithArray:self.instrument.pointArray];
    [self.instrument.lineArray addObject:array];
    self.instrument.pointArray = [NSMutableArray new];
    
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
    [figuresArray removeLastObject];
    [instrument.lineArray removeAllObjects];
    [self setNeedsDisplay];
}
@end
